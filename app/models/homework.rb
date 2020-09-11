class Homework < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :lesson
    belongs_to :user
    has_many :comments

    before_destroy :destroy_s3

    def destory_s3
        self.image.remove! if self.image
        self.save!
    end
end
