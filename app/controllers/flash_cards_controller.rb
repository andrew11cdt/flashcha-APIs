class FlashCardsController < ApplicationController
    def index
        if params[:lesson_ids]
            flashcards = FlashCard.all
            result = {}
            params[:lesson_ids].each do |id|
                result[id]=flashcards.where(lesson_id: id)
            end
            # render_paging_json(flashcards, params[:page], params[:per])
            render json: result, status: 200
            else raise "Missing lesson_ids"
        end
    end
    def show
        @flashcard = FlashCard.find(params[:id])
    end
    def array_create
        result = {}
        result[params[:lesson_id]] = []
        if params[:flash_cards]
            params[:flash_cards].each_with_index do |flashcard,i|
                f = FlashCard.create(flashcards_array_params[:flash_cards][i].merge!(lesson_id: params[:lesson_id]))
                result[params[:lesson_id]].push(f)
            end
        else raise 'Missing params flashcards'
        end
        if result[params[:lesson_id]].length > 0 
            render json: result
        else raise 'Could not create'
        end
    end
    def create
        flashcard = FlashCard.new(flashcard_params)
        flashcard.save!
    end
    def update
        @flashcard = FlashCard.find(params[:id])
        @flashcard.update(flashcard_params)       
        render json: @flashcard, status: 200
    end
    def destroy
        @flashcard = FlashCard.find(params[:id])
        @flashcard.destroy
        render json: 'destroyed', status: 200
    end
    # def destroy_all
    #     FlashCard.all.each do |f|
    #         f.destroy
    #     end
    #     render json: FlashCard.all, status: 200
    # end
    private
    def flashcard_params
        params.require(:flash_card).permit(:word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
    def flashcards_array_params
        params.require(:lesson_id)
        params.permit({flash_cards: [:word, :hiragana, :lesson_id, :sino, :ipa, :example]}, :lesson_id)
    end
end