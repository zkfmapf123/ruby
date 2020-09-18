class ApplicationController < ActionController::Base
    attr_reader :index, :findFirst, :findSecound
    include SessionHelper

    def index(args)
        if args[:search] && args[:findText]
            textString = args[:search].split("_")
            if textString[0] == "lesson"
                @findFirst = Lesson
                @findSecound = textString[1]
            else
                @findFirst = Professor
                @findSecound = textString[1]
            end
            @index = @findFirst.where(" #{@findSecound} like ?", "%#{args[:findText]}%").limit(20)
        else
            #제일 높은 점수를 받은 강의중 강의평가 최근거 6개
            @index = args[:index].limit(10).order(view: :desc)
        end

        if @index.empty?
            flash[:no_find] = "검색 결과가 없습니다"
        end
    end

    def detail(args)
        begin
            @index = args[:index].find(params[:id])
            if args[:index] == Lesson
                if @index.lesson_eval.find_by_user_id(current_user().id).valid?
                    raise "error"
                end
                @indexNumber = ((@index.score.to_f) / (@index.lesson_evals.count.to_f)).round(1)
            elsif args[:index] == Professor
                if @index.professor_evals.find_by_user_id(current_user().id).valid?
                    raise "error"
                end
                @indexNumber = ((@index.score.to_f) / (@index.professor_evals.count.to_f)).round(1)
            end
        rescue => exception
            flash[:alert] = "평가는 하나만 가능합니다."
        ensure
            @index.view += 1
            @index.save
        end
    end

    # deprecated
    def sort(args)

    end

    def create(args)
        #lesson, professor view update
        @index = args[:index].find(args[:id])
        @index.score += args[:total]
        @index.save
    end

    def favorite(args)
        
    end
end
