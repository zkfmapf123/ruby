class HomeworkController < ApplicationController
    attr_reader :index, :pageNumber, :per_page, :flag, :comment
    before_action :isNotUser
    # /homework/user
    def index
        @index = User.find(current_user().id).homeworks.order(created_at: :desc)
    end

    # /homework/default
    def default
        
    end

    # /homework/lesson/:id
    def lesson
        @per_page = 10

        # search
        if params[:homeworkSearch] && params[:search]

            @index = Lesson.find(params[:id]).homeworks.order(created_at: :desc).where("#{params[:homeworkSearch]} like ?","%#{params[:search]}%")
            @flag = 1;
        else
            @index = Lesson.find(params[:id]).homeworks.order(created_at: :desc).paginate(page: params[:page], per_page: @per_page)
            @flag = 0;
        end
        
        if @index.length <= 10
            @pageNumber = 1
        else
            @pageNumber = (@index.length.to_f / @per_page.to_f).ceil + 1 
        end
    end

    # /homework/:id/detail
    def detail
        @index = Homework.find(params[:id])
        @index.view +=1
        @index.save
        @comment = @index.comments.order(created_at: :desc)
    end

    # /homework/:id/create
    def homeworkCreate
        @index = User.find(current_user().id).comments.build(
            homework: Homework.find(params[:id]))
        @index.description = params[:content];
        @index.save

        redirect_to :controller => "homework", action: "detail"
    end

    # /homewokr/lesson/:id/create
    def create
        
    end

    # /homewokr/lesson/:id/postCreate
    def postCreate
        l = Lesson.find(params[:lessonId])
        
        @index = Homework.new
        @index.lesson_id = params[:lessonId]
        @index.user_id = current_user().id
        @index.title = params[:title]
        @index.description = params[:description]
        @index.image = params[:image]

        @index.save

        redirect_to :controller => "homework", action: "lesson"
    end

    # 글 지우기
    def delete
        begin
            if Homework.find(params[:id]) == nil
                raise "error"
            end
            @index = Homework.find(params[:id]).destroy
            @index.save
        rescue => exception
            flash[:alert] = "올바르지 못한 방법입니다"
        end

        redirect_to :controller => "homework", action: "default"
        
    end

    # 댓글 지우기
    def commentDelete
        begin
            if Comment.find(params[:id]) == nil
                raise "error"
            end
            @index = Comment.find(params[:id]).delete
            @index.save
        rescue => exception
            flash[:alert] = "올바르지 못한 명령입니다"
        end

        redirect_to :controller => "homework", action: "default"
    end
end
