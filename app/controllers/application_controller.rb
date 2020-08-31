class ApplicationController < ActionController::Base
    include SessionHelper

    def index(index)
        @index = index.limit(5).order(:score)
    end
end
