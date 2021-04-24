class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :username, :email, presence: true
    validates :username, uniqueness: true, on: :create
    validates :password, length: { minimum: 8 }
end
