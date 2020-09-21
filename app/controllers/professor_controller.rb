class ProfessorController < ApplicationController
    before_action :isNotUser

    def index
        super(
            :index=> Professor,
            :search => params[:searchFind],
            :findText => params[:search]
            )
    end

    def detail
        super(:index => Professor)
    end

    def create
        # 미리검사
        @index = Professor.find(params[:id]).professor_evals.build(
            user: User.find(current_user().id))
        @index.comment= params[:content]
        @index.score1=params[:point1]
        @index.score2=params[:point2]
        @index.score3=params[:point3]
        @index.score4=params[:point4]
        @index.save

        @total = (@index.score1 + @index.score2 + @index.score3 + @index.score4)/4

        super(
            :index => Professor,
            :id => params[:id],
            :total => @total
        )

        redirect_to :controller => "professor", action: "detail"
    end

    # professor/:id/delete
    def delete
        begin
            if ProfessorEval.find(params[:id])==nil
                raise "error"
            end
            @index = ProfessorEval.find(params[:id]).delete
            @index.save
        rescue => exception
            flash[:alert] = "올바르지 못한 명령입니다"
        end

        redirect_to :controller => "professor", action: "detail"
    end

    def good_bad_flag 
        @index = ProfessorUserFlag.where(user: User.find(current_user().id), professor: Professor.find(params[:id]))

        if @index.empty?
            @userFlag = @index.build(
                professor: Professor.find(params[:id]))
            @userFlag.save
        end

        super(:index => @index,
              :subject => Professor.find(params[:id]))

        redirect_to :controller => "professor", action: "detail"
    end
end
