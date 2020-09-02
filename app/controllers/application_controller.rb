class ApplicationController < ActionController::Base
    include SessionHelper

    def index(args)
        @index = args[:index].limit(6).order(:score)
    end

    def detail(args)
        @index = args[:index].find(args[:id])
    end
end
