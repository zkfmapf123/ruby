class LessonController < ApplicationController
    # before_action :isNotUser

    def index
        super(:index=>Lesson)
    end

    def detail
        super(
            :index => Lesson,
            :id => params[:id]
        )
    end

    def create
        super
    end
end
