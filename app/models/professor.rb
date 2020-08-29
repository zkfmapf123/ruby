class Professor < ApplicationRecord
    after_initialize :set_default

    validates :name, presence: true
    validates :major, presence: true
    def set_default
        self.image_url = "person.jpg" #public에 올라갈거임..
    end
end
