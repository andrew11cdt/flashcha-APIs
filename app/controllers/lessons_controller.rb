class LessonsController < ApplicationController
    def index
      if params[:course_id].present?
        @lessons = Lesson.where(course_id: params[:course_id])
      else
        @lessons = Lesson.all
      end
      render json: @lessons, status: 200
    end

    def show
        @lesson = Lesson.find(params[:id])
        render json: @lesson, status: 200
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.save!
        render json: @lesson, status: 201
    end

    def update
        @lesson = Lesson.find(params[:id])
        @lesson.update(lesson_params)
        render json: @lessons, status: 200
    end

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
        render json: @lessons, status: 200
    end

    private
    def lesson_params
        params.require(:lesson).permit(:name, :course_id)
    end
end
