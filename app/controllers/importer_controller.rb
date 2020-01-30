class ImporterController < ApplicationController
    def import_file
        # spreadsheet = Roo::Excelx.new(file)
        # data = Roo::Spreadsheet.open(Rails.root.join('app','assets','N1-N2-mimikara-goi-shinkanzen-bunpo.xlsx'), extension: :xlsx)
        data = Roo::Spreadsheet.open(params[:file])
        sheets = {}
        data.sheets.to_a.each do |s|
            sheet_data = data.sheet(s)
            sheets[s] = {title: s, total: sheet_data.last_row-1, headers: sheet_data.row(1), data: sheet_data.to_a}
            # binding.pry
        end
        @file = sheets
        render json: sheets
    end
    def create_file
        if (params[:lang_code] && params[:level_id] && params[:sheet])
            binding.pry
            sheet_key = @file.keys[params[:sheet].to_i]
            file = @file[sheet_key]
            lang_id = Language.where(lang_code: params[:lang_code]).to_a.first.id
            new_course = {name: file.title, level_id: params[:lang_code], language_id: lang_id}
            # Course.create(:name, :level_id, :language_id)
        end
        # if params[:sheet] && params[:page] && params[:per]
        #     course = {}
        #     data.page(1).total_pages.to_a.each do |page|
        #         course['lesson_'+ page] = data.page(page).per(params[:per])
        #     end
        # else return 'Missing params', status: 500
    end

    # def import
        # data = FlashCard.import_file
        # sheet2 = data.sheet 2
        # importData((2..271), sheet2)
    # end
    private
    def createData(arr, sheet)
        headers = sheet.row(1)
        word_index = headers.index('word')
        hira_index = headers.index('hiragana')
        meaning_index = headers.index('meaning_vi')
        cards = []
        cards_translations = []

        arr.to_a.each do |i|
            card = {id: i-1, word: sheet.row(i)[word_index], hiragana: sheet.row(i)[hira_index], lesson_id: params[:lesson_id]}
            flashcard = FlashCard.create(card)
            
            course_id = Lesson.where(id: params[:lesson_id]).to_a.first.course_id
            language_id = Course.where(id: course_id).to_a.first.language_id
            
            card_meaning = {id: i-1, meaning: sheet.row(i)[meaning_index], language_id: language_id, flash_card_id: flashcard.id}
            card_translation = CardTranslation.create(card_meaning)
        end
    end
end
