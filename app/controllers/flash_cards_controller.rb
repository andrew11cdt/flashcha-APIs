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
        params.permit(:id, :word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
end
 