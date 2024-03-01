class Center < ApplicationRecord
  belongs_to :user
  has_many :appointment
  has_one :schedule
end
