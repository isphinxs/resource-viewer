class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :username, :email, :password, presence: true
    validates :username, uniqueness: true, on: :create
end
