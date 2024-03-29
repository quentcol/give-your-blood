class User < ApplicationRecord
  enum category: { donor: 0, hospital: 1 }
  validates :category, presence: true, if: :new_record?
  has_one :hospital, dependent: :destroy
  has_one :center, through: :hospital, source: :centers
  has_one :donor
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
