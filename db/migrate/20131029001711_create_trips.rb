class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title, :destination, :start
    	t.references :user
    	t.integer :available_seats
    	t.datetime :departure_time
      t.timestamps
    end
  	add_index :trips, :user_id
  end
end
