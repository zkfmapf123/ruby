class HomeworkController < ApplicationController
    before_action :isNotUser
    # /homework/user
    def index
        
    end

    # /homework/lesson/:id
    def lesson
        
    end

    # /homework/lesson/:id/detail
    def detail
        
    end
    
    #연습
    def create
        @l = Lesson.find(1)
        @u = User.find(1)
        
        @index = Homework.new
        @index.lesson_id = @l.id
        @index.user_id = @u.id
        @index.title = params[:title]
        @index.image = params[:image]


        @index.save

        redirect_to :controller => "home", action: "index"
    end
end
