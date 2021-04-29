class Resource < ApplicationRecord
  belongs_to :organization
  has_many :ratings
  has_many :users, through: :ratings
  has_many :resource_categories, dependent: :destroy
  has_many :categories, through: :resource_categories
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes["name"].blank? }
  accepts_nested_attributes_for :organization, reject_if: proc { |attributes| attributes["name"].blank? }
  
  validates :name, :amount, :link, :description, presence: true
  validates :name, uniqueness: true, on: :create

  scope :alphabetical, -> { order("name") }

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      if !category_attribute[:name].blank?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end
  
  def organization_name
    self.organization ? self.organization.name : nil
  end
  
  def organization=(name)
    self.organization = Organization.find_or_create_by(name: name)
  end
end
