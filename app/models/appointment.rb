class Appointment < ApplicationRecord
  belongs_to :donor
  belongs_to :center

  enum status: { pending: 0, approved: 1, denied: 2, canceled: 3 }, _prefix: true

end
