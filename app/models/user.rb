class User < ApplicationRecord
    has_secure_password
    validates :username, :password, presence: true
end
