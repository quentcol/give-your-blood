class Center < ApplicationRecord
  belongs_to :hospital
  has_many :reviews
  has_many :schedules
  has_many :appointments
  has_many :doners, through: :appointments
end
