class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :boats
  has_many :bookings # bookings user have made of other boats
  has_many :boat_bookings, through: :boats, source: :bookings # bookings of user's own boats
end
