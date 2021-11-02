class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 50}
    validates :email, presence: true, 
            format: {with: VALID_EMAIL_REGEX},
            length: { maximum: 255},
            uniqueness: { case_sensitive: false}
    before_save :down_email
    has_secure_password

    private

        def down_email
            self.email.downcase
        end
end
