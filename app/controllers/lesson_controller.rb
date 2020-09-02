class LessonController < ApplicationController
    # before_action :isNotUser

    def index
        super(Lesson)
    end

    def detail
        super(Lesson,params[:id])
    end
end
