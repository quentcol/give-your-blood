class User < ApplicationRecord
  has_many :hospitals
  has_one :donor 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
