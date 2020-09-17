class LessonController < ApplicationController
    attr_reader :index, :lesson, :total
    before_action :isNotUser

    #/lesson
    def index
        super(
            :index=>Lesson,
            :search => params[:searchFind],
            :findText => params[:search]
            )
    end

    #/lesson/:id/detail
    def detail
        super(:index => Lesson)
    end

    # /lesson/sort/:id ==> deprecated
    # def sort
    #
    # end

    #/lesson/:id/create
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

    # lesson/:id/delete
    def delete
        begin
            if LessonEval.find(params[:id]) == nil
                raise "error"
            end
            @index = LessonEval.find(params[:id]).delete
            @index.save
            
        rescue => exception
            flash[:alert] = "올바르지 못한 명령입니다"    
        end

        redirect_to :controller => "lesson", action: "detail"
    end

    #lesson/:id/detail/favorite
    def favorite
        @index = LessonUserFlag.where(
            user: User.find(current_user().id),
            lesson: Lesson.find(params[:id]))
        if @index.empty?
            @index = User.find(current_user().id).lesson_user_flags.build(
                    lesson: Lesson.find(params[:id]),
                    favorite_flag: false)
            @index.save
        else
            # 찜하기가 안되있을 경우 와 되있을 경우
            @index[0].favorite_flag == true ? 
                (@index[0].favorite_flag = false) : (@index[0].favorite_flag = true)
            @index[0].save

            #true 일때가 찜한거임...

            redirect_to :controller => "lesson", action: "detail"
        end
    end
end
