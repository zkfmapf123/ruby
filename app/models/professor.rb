class Professor < ApplicationRecord
    #relation
    has_many :professor_evals
    has_many :lessons
    
    after_initialize :set_default

    validates :name, presence: true
    validates :major, presence: true
    
    def set_default
        self.image_url = "professor.jpg" #public에 올라갈거임..
        self.score = 0
    end
end
