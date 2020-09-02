class ProfessorController < ApplicationController
    before_action :isNotUser

    def index
        super(:index => Professor)
    end

    def detail
        super(
            :index => Professor,
            :id => params[:id]
        )
    end

    def create
        
    end
end
