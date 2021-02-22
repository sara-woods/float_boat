class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user

  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
