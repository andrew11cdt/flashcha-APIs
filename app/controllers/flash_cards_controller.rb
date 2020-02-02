class FlashCardsController < ApplicationController
    def index
        flashcards = FlashCard.all
        render_paging_json(flashcards, params[:page], params[:per])
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
        render json: @flashcards, status: 200
    end
    # def destroy_all
    #     FlashCard.all.each do |f|
    #         f.destroy
    #     end
    #     render json: FlashCard.all, status: 200
    # end
    private
    def flashcard_params
        params.require(:flashcard).permit(:id, :word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
end
 