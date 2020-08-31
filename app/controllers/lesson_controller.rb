class LessonController < ApplicationController
    def index
        isNotUser()
        super(Lesson)
    end
end
