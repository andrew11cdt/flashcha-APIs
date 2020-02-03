class FlashCardsController < ApplicationController
    def index
        flashcards = FlashCard.all
        if (params[:lesson_id]) 
            flashcards = flashcards.where(lesson_id: params[:lesson_id])
            # render_paging_json(flashcards, params[:page], params[:per])
            render json: flashcards, status: 200
            else raise "Missing lesson_id"
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
        params.permit(:id, :word, :hiragana,:lesson_id, :sino, :ipa, :example)
    end
end
 