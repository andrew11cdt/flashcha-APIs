class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def create
    @course = Course.new(course_params)
    raise InvalidParams unless course_params[:language_id]
    @course.save
  end
  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    render json: @courses, status: 200
  end
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    render json: @courses, status: 200
  end
  private
    def course_params
        params.require(:course).permit(:name, :level_id, :language_id)
    end
end
