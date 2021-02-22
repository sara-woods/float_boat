class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.integer :daily_rate
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
