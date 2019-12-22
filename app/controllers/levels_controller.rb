class LevelsController < ApplicationController
  def index
    lvls = Level.all
    render json: lvls, status: 200
  end
end
