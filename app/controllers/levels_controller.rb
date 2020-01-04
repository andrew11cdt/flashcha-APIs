class LevelsController < ApplicationController
  def index
    @lvls = Level.all
    render json: @lvls, status: 200
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
    @lvl.destroy
    render json: @lvls, status: 200
  end
  private
    def lvl_params
        params.require(:lvl).permit(:name, :level)
    end
end
