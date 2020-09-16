class Homework < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :lesson
    belongs_to :user
    has_many :comments, dependent: :destroy
    before_destroy :destroy

    def destory
        self.image.remove! if self.image
        self.save!
    end
end
