class FlashCardsController < ApplicationController
    def index
        @flashcards = FlashCard.all
        render json: @flashcards, status: 200
    end
    def create
        @flashcard = FlashCard.new(flashcard_params)
        @flashcard.save
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
    private
    def flashcard_params
        params.require(:flash_card).permit(:word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
end
