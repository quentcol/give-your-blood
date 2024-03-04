class Schedule < ApplicationRecord
  belongs_to :day
  belongs_to :center
  validates :day_id, :center_id, :opening_time, :closing_time, presence: true
end
