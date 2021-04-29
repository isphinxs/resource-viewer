class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :resource

    scope :average_rating, ->(id) { select("resource_id, avg(rating) as avg_rating").where("resource_id = ?", id) }

    def resource_name
        self.resource.name
    end
end
