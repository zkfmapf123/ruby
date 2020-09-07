class Lesson < ApplicationRecord
    #relation
    belongs_to :professor
    has_many :lesson_evals, :dependent => :destroy
    has_many :homeworks, :dependent => :destroy
end
