class ProfessorEval < ApplicationRecord
    #realtion
    belongs_to :user
    belongs_to :professor
end
