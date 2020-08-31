class Lesson < ApplicationRecord
    #relation
    belongs_to :professor
    has_many :lesson_evals
    
    after_initialize :set_default

    def set_default
        self.score = 0
    end
end
