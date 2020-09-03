class LessonEval < ApplicationRecord
    #relation
    belongs_to :lesson
    belongs_to :user
end
