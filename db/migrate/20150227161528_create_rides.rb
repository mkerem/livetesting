class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :pickup
      t.integer :dropoff
      t.integer :passenger_count
      t.text :comments

      t.timestamps
    end
  end
end
