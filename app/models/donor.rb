class Donor < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :appointments
  validates :user_id, uniqueness: true 
end
