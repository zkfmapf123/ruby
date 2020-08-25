class User < ApplicationRecord
    has_secure_password
    after_initialize :set_default
    before_save {self.email = email.downcase }

    VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 50},
        format: {with: VALID_EMAIL_REGEX},
        uniqueness: {case_sensitive: false}
    validates :major, presence: true

    def set_default
        self.alert = 0
    end

end
