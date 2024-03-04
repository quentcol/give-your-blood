class Center < ApplicationRecord
  belongs_to :hospital
  has_many :reviews
  has_many :schedules
  has_many :appointments
end
