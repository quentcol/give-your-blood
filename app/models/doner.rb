class Doner < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :appointments
end
