class AddUserToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
