class ApplicationController < ActionController::Base
    attr_reader :index
    include SessionHelper

    def index(args)
        #제일 높은 점수를 받은 강의중 강의평가 최근거 6개
        @index = args[:index].limit(6).order(score: :desc)
    end

    def detail(args)
        @index = args[:index].find(params[:id])
        @index.view += 1
        @index.save
    end

    def create(args)
        #lesson, professor view update
        @index = args[:index].find(args[:id])
        @index.score += args[:total]
        @index.save
    end
end
