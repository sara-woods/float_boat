class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :user

  validates :content, presence: true
end
