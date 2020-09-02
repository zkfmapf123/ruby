class ProfessorController < ApplicationController
    before_action :isNotUser

    def index
        super(Professor)
    end

    def detail
        super(Professor,params[:id])
    end
end
