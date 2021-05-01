class Organization < ApplicationRecord
    has_many :resources, dependent: :destroy
    validates :name, presence: true, uniqueness: true

    scope :alphabetical, -> { order("name") }
    scope :totals_by_organization, -> { joins(:resources).select("organizations.id, sum(resources.amount) as total_amount").group("organizations.id") }

    def find_total_funding
        funding_totals = Organization.totals_by_organization
        total = funding_totals.detect { |org| org.id == self.id}
        total.nil? ? 0 : total.total_amount
    end
end
