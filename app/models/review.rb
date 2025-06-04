class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true

  validates :content, presence: true
  validates :cleanliness_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :accuracy_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :chekin_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :communication_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :location_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :value_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_commit :update_final_rating, on: [ :create, :update ]
  after_commit :update_final_average_rating, on: [ :create, :update ]

  private

  def update_final_rating
    update_column(:final_rating, (cleanliness_rating + accuracy_rating + chekin_rating + communication_rating + location_rating + value_rating) / 6.0)
  end

  def update_final_average_rating
    property.update_column(:average_final_rating, property.reviews.average(:final_rating))
  end
end
