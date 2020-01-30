class CardTranslationsController < ApplicationController
  def index
      card_trs = CardTranslation.all
      render_paging_json(card_trs, params[:page], params[:per])
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
