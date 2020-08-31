class ProfessorUserFlag < ApplicationRecord
    belgons_to :professor
    belgons_to :user
end
