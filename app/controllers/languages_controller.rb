class LanguagesController < ApplicationController
    def index
        @languages = Language.all
        render json: @languages, status: 200
    end
    def create
        @language = Language.new(language_params)
        @language.save
        render json: Language.all, status: 200
    end
    def update
        @language = Language.find(params[:id])
        @language.update(language_params)
        render json: Language.all, status: 200
    end
    def destroy
        @language = Language.find(params[:id])
        @language.destroy
        render json: Language.all, status: 200
    end
    private
    def language_params
        params.require(:language).permit(:name, :lang_code)
    end
end
