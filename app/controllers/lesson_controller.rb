class LessonController < ApplicationController
    attr_reader :index, :lesson, :total
    before_action :isNotUser

    def index
        super(:index=>Lesson)
    end

    def detail
        super(:index => Lesson)
    end

    def create
        # 미리검사
        @index = Lesson.find(params[:id]).lesson_evals.build(
            user: User.find(current_user().id))
        @index.comment= params[:content]
        @index.score1=params[:point1]
        @index.score2=params[:point2]
        @index.score3=params[:point3]
        @index.score4=params[:point4]
        @index.save

        @total = (@index.score1 + @index.score2 + @index.score3 + @index.score4)/4

        super(
            :index => Lesson,
            :id => params[:id],
            :total => @total
        )

        redirect_to :controller => "lesson", action: "detail"
    end
end
