class Appointment < ApplicationRecord
  belongs_to :donor
  belongs_to :center

  enum status: { pending: 0, approved: 1, denied: 2, canceled: 3 }, _prefix: true

  def mark_as_canceled?
    update(status: 'canceled')
  end

  private

  def set_default_status
    self.status ||= :pending
  end

end
