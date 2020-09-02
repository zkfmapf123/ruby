class ApplicationController < ActionController::Base
    include SessionHelper

    def index(index)
        @index = index.limit(6).order(:score)
    end
end
