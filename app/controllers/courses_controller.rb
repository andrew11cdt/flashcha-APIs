class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: @courses, status: 200
  end
  def show
    @course = Course.find(params[:id])
    render json: @course, status: 200
  end
  def show_lesson
    @lessons = Lesson.where(course_id: params[:id])
    render json: @lessons, status: 200
  end
  def create
    course = Course.new(course_params)
    raise InvalidParams unless course_params[:language_id]
    course.save
    render json: Course.all, staus: 200
  end
  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    render json: Course.all, status: 200
  end
  def destroy
    course = Course.find(params[:id])
    lessons = Lesson.where(course_id: course.id)
    lessons.each do |l|
      l.destroy unless !l
    end unless lessons.empty?
    course.destroy unless !course
    render json: Course.all, status: 200
  end
  private
    def course_params
        params.require(:course).permit(:name, :level_id, :language_id)
    end
end
