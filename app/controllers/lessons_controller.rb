class LessonsController < ApplicationController
    def index
        @lessons = Lesson.all
    end
    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.save
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
    def Lesson_params
        params.require(:Lesson).permit(:name, :course_id)
    end
end
