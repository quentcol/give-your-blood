class Appointment < ApplicationRecord
  belongs_to :donor
  belongs_to :center

  def mark_as_canceled?
    update(status: 'canceled')
  end
end
