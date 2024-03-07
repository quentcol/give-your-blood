class Hospital < ApplicationRecord
  belongs_to :user
  has_many :centers
  has_many :donors, through: :centers
end
