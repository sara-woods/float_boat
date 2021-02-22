class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :daily_rate, presence: true
  validates :address, presence: true
end
