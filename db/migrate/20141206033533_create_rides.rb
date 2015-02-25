class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.string :Present
      t.string :Dropoff
      t.string :Passengers

      t.timestamps
    end
  end
end
