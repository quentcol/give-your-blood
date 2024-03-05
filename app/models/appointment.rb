class Appointment < ApplicationRecord
  belongs_to :doner
  belongs_to :center
end
