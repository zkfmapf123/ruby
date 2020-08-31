class LessonEval < ApplicationRecord
    #relation
    belongs_to :lesson
    belongs_to :user

    after_initialize :set_default

    def set_default
        self.goodPoint= 0
        self.badPoint=0
        self.views=0
        self.score1=0
        self.score2=0
        self.score3=0
        self.score4=0
    end
end
