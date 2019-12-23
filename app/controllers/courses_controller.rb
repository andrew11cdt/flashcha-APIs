class CoursesController < ApplicationController
  def index
    render json: { data: :ok }, status: 200
  end
end
