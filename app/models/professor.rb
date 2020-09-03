class Professor < ApplicationRecord
    #relation
    has_many :professor_evals, :dependent => :destroy
    has_many :lessons, :dependent => :destroy

    validates :name, presence: true
    validates :major, presence: true
    
end
