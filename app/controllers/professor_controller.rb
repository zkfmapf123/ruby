class ProfessorController < ApplicationController
    def index
        isNotUser()
        super(Professor)
    end
end
