class User < ApplicationRecord
    #relation
    has_many :professor_evals, dependent: :destroy #교수평가
    has_many :lesson_evals, dependent: :destroy    #수업평가
    has_many :favorites, dependent: :destroy       #찜한목록
    has_many :lesson_user_flags, dependent: :destroy  #수업_유저_공감_flag
    has_many :professor_user_flags, dependent: :destroy #교수_유저_공감_flag
    has_many :homeworks, dependent: :destroy #과제공유
    has_many :homework_user_flags, dependent: :destroy #코맨트_유저_공감_flag
    has_many :comments, dependent: :destroy #누가 댓글썻니?
    has_many :homework_user_flags, dependent: :destroy
    has_secure_password
    before_save {self.email = email.downcase }

    VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 50},
        format: {with: VALID_EMAIL_REGEX},
        uniqueness: {case_sensitive: false}
    validates :major, presence: true
end
