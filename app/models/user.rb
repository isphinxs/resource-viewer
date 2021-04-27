class User < ApplicationRecord
    has_many :ratings
    has_secure_password
    validates :first_name, :last_name, :username, presence: true
    validates :username, uniqueness: true, on: :create
    validates :password, length: { minimum: 8 }

    include ActiveModel::Validations
    validates_with EmailValidator
end
