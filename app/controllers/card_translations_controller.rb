class CardTranslationsController < ApplicationController
  def index
      if params[:flashcards_id]
        card_trs = CardTranslation.all
        ids = params[:flashcards_id]
        # card_trs = card_trs.where(flash_card_id: ids)
        result = {}
        ids.each do |id|
          result[id] = card_trs.where(flash_card_id: id)
        end
        # render_paging_json(card_trs, params[:page], params[:per])
        render json: result, status: 200
        else raise "Missing flashcards_id"
      end
  end
  def show
    @card_tr = CardTranslation.find(params[:id])
  end
  def create
    @card_tr = CardTranslation.new(card_tr_params)
    @card_tr.save
  end
  def update
    @card_tr = CardTranslation.find(params[:id])
    @card_tr.update(card_tr_params)
    render json: @card_trs, status: 200
  end
  def destroy
    @card_tr = CardTranslation.find(params[:id])
    @card_tr.destroy
    render json: @card_trs, status: 200
  end
  private
    def card_tr_params
        params.permit(:flash_card_id, :language_id, :meaning, :sino_vi, :ex_meaning)
    end
end
