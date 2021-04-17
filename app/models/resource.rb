class Resource < ApplicationRecord
  belongs_to :organization
  has_many :resource_categories
  has_many :categories, through: :resource_categories
end
