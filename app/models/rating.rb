class Rating < ApplicationRecord
    has_many :users
    has_many :resources

    scope :average_rating, ->(id) { select("resource_id, avg(rating) as avg_rating").where("resource_id = ?", id) }

end
