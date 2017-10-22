class CreatePickups < ActiveRecord::Migration[5.1]
  def change
    create_table :pickups do |t|
      t.string :pickup_location
      t.string :day
      t.datetime :start_time
      t.datetime :end_time
      t.text :remarks

      t.timestamps
    end
  end
end
