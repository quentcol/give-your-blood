class Review < ApplicationRecord
  belongs_to :center
  belongs_to :donor

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :review_content, presence: true
end
