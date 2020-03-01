class CardTranslationsController < ApplicationController
  def index
      if params[:flashcard_ids]
        card_trs = CardTranslation.all
        ids = params[:flashcard_ids]
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
  def array_create
    results = []
    if params[:card_translates].length > 0
        params[:card_translates].each_with_index do |card_tr, i|
          # todo: create unless flash_card_id and language_id params is existed
          p = arr_card_tr_params[:card_translates][i].merge!({language_id: params[:language_id]})
          existCardTr = CardTranslation.find_by({flash_card_id: p['flash_card_id'], language_id: p['language_id']})
            f = CardTranslation.create(p) unless existCardTr
            results.push(f) unless f
        end
    else raise 'Missing params flashcards'
    end
    if results.length > 0 && !!results[0]
        render json: results
    else raise 'Could not create'
    end
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
    def arr_card_tr_params
        params.require(:language_id)
        params.permit({card_translates: [:flash_card_id, :language_id, :meaning, :sino_vi, :ex_meaning]}, :language_id)
    end
end
