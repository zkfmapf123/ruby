class ProfessorEval < ApplicationRecord
    #realtion
    belongs_to :user
    belongs_to :professor

    after_initialize :set_default

    def set_default
        self.goodPoint= 0
        self.badPoint=0
        self.views=0
        self.score1=0   #평가항목1
        self.score2=0   #평가항목2
        self.score3=0   #평가항목3
        self.score4=0   #평가항목4
    end
end
