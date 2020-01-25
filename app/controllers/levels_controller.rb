class LevelsController < ApplicationController
  def index
    @lvls = Level.all
    render json: @lvls, status: 200
  end
  def show
    @lvl = Level.find(params[:id])
    render json: @lvl, status: 200
  end
  def create
    @lvl = Level.new(lvl_params)
    @lvl.save
  end
  def update
    @lvl = Level.find(params[:id])
    @lvl.update(lvl_params)
    render json: @lvls, status: 200
  end
  def destroy
    @lvl = Level.find(params[:id])
    @lvl.destroy!
    render json: @lvls, status: 200
  end
  private
    def lvl_params
      binding.pry
      # security strong params, is_banned: true
      # account endpoint API update info acount. name:(params{:account,is_banned: faulse})
     params.permit(:name, :lvl_no, :parent_lvl_id, :difficulty)
    end
    # params: { name: asda, level: asdasd }
end
