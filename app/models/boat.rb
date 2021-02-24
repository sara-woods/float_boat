class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :daily_rate, presence: true
  validates :address, presence: true
end
