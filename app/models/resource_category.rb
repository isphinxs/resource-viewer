class ResourceCategory < ApplicationRecord
  belongs_to :category
  belongs_to :resource
end
