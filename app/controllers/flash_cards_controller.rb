class FlashCardsController < ApplicationController
    def index
        flashcards = FlashCard.all
        render_paging_json flashcards
        # render json: flashcards
    end
    def show
        @flashcard = FlashCard.find(params[:id])
    end
    def create
        @flashcard = FlashCard.new(flashcard_params)
        @flashcard.save!
    end
    def update
        @flashcard = FlashCard.find(params[:id])
        @flashcard.update(flashcard_params)       
        render json: @flashcard, status: 200
    end
    def destroy
        @flashcard = FlashCard.find(params[:id])
        @flashcard.destroy
        render json: @flashcards, status: 200
    end
    def import
        data = FlashCard.import_file
        sheet2 = data.sheet 2
        headers = sheet2.row(1)
        word_index = headers.index('word')
        hira_index = headers.index('hiragana')
        meaning_index = headers.index('meaning_vi')
        cards = []
        cards_translations = []
        (2..sheet2.last_row).to_a.each do |i|
            card = {word: sheet2.row(i)[word_index], hiragana: sheet2.row(i)[hira_index], lesson_id: params[:lesson_id]}
            flashcard = FlashCard.create(card)
            card_meaning = {meaning: sheet2.row(i)[meaning_index], language_id: params[:language_id], flash_card_id: flashcard.id}
            # binding.pry
            card_translation = CardTranslation.create(card_meaning)
            # @flashcard.new()
        end
    end
    private
    def flashcard_params
        params.permit(:word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
    def render_paging_json flashcards
        meta = {}
        if params[:page] && params[:per]
          flashcards = flashcards.page(params[:page]).per(params[:per])
          meta = pagination_dict(flashcards)
        end
        render json: flashcards, meta: pagination_dict(flashcards), root: 'data'
    end
end
 