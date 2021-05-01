class Category < ApplicationRecord
    has_many :resource_categories
    has_many :resources, through: :resource_categories, dependent: :destroy

    validates :name, presence: :true, uniqueness: true

    scope :alphabetical, -> { order("name") }

    before_save do
        self.name = name.downcase
    end
end
