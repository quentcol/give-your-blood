class Center < ApplicationRecord
  belongs_to :hospital
  has_many :reviews
  has_many :schedules
  has_many :appointments
  has_many :doners, through: :appointments
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
