class Organization < ApplicationRecord
    has_many :resources
    validates :name, presence: true, uniqueness: true

    scope :alphabetical, -> { order("name") }
    scope :totals_by_organization, -> { joins(:resources).select("organizations.id, sum(resources.amount) as total_amount").group("organizations.id") }
end
