class Comment < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :homework
    belongs_to :user
    has_many :homewokr_user_flags

    before_destroy :destroy_s3

    def destory_s3
        self.image.remove! if self.image
        self.save!
    end
end
