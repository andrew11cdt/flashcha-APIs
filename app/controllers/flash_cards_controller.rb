class FlashCardsController < ApplicationController
    def index
        @flashcards = FlashCard.all
    end
    def create
        @flashcard = FlashCard.new(flashcard_params)
        @flashcard.save
    end
    def update
        @flashcard = FlashCard.find(params[:id])
        @flashcard.update(flashcard_params)
    render json: @flashcards, status: 200
    end
    def destroy
        @flashcard = FlashCard.find(params[:id])
        @flashcard.destroy
        render json: @flashcards, status: 200
    end
    private
    def flashcard_params
        params.require(:language).permit(:word, :lesson_id, :hiragana, :sino, :ipa, :example)
    end
end
