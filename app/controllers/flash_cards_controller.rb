class FlashCardsController < ApplicationController
    def index
        flashcards = FlashCard.all
        render_paging_json(flashcards, params[:page], params[:per])
    end
    def show
        @flashcard = FlashCard.find(params[:id])
    end
    def create
        flashcard = FlashCard.new(create_params)
        flashcard.save!
    end
    def update
        @flashcard = FlashCard.find(params[:id])
        @flashcard.update(update_params)       
        render json: @flashcard, status: 200
    end
    def destroy
        @flashcard = FlashCard.find(params[:id])
        @flashcard.destroy
        render json: @flashcards, status: 200
    end
    private
    def update_params
        params.require(:flashcard).permit(:id, :word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
    def create_params
        params.require(:flashcard).require(:lesson_id, :word)
        params.require(:flashcard).permit(:id, :word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
end
 