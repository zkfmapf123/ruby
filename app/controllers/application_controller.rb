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
        @index = args[:index].find(params[:id])
        @index.view += 1
        @index.save
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
end
