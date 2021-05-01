class User < ApplicationRecord
    has_many :ratings
    has_many :resources, through: :ratings
    has_secure_password
    validates :first_name, :last_name, :username, presence: true
    validates :username, uniqueness: true, on: :create
    validates :password, length: { minimum: 8 }, allow_nil: true

    include ActiveModel::Validations
    validates_with EmailValidator
end
