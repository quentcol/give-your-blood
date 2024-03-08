class Donor < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :appointments
  validates :user_id, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
