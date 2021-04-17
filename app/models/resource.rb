class Resource < ApplicationRecord
  belongs_to :organization
  has_many :resource_categories
  has_many :categories, through: :resource_categories
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :organization

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
  
  def organization_name
    self.organization ? self.organization.name : nil
  end
  
  def organization=(name)
    self.organization = Organization.find_or_create_by(name: name)
  end
end
