class Hospital < ApplicationRecord
  belongs_to :user
  has_many :centers
  has_many :doners, through: :centers
end
