class Organization < ApplicationRecord
    has_many :resources
    validates :name, presence: true, uniqueness: true

    scope :alphabetical, -> { order("name") }
end
