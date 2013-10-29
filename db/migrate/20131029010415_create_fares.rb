class CreateFares < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.references :passenger, :trip
      t.boolean :approved, default: false
      t.timestamps
    end
    add_index :fares, :passenger_id
    add_index :fares, :trip_id
    add_index :fares, [:passenger_id, :trip_id], unique: true
  end
end
