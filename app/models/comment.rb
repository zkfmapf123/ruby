class Comment < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :homework
    belongs_to :user
    has_many :homework_user_flags, dependent: :destroy

    # s3 이놈은 안씀
end
