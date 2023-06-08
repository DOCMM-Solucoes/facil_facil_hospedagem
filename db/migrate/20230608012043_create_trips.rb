class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :establishment, null: false, foreign_key: true
      t.references :guide, null: false, foreign_key: true
      t.date :checkin_date
      t.time :checkin_time
      t.date :checkout_date
      t.time :checkout_time
      t.boolean :extra_coffee
      t.integer :num_people
      t.integer :num_drivers
      t.boolean :free_driver
      t.integer :num_guides
      t.boolean :free_guide
      t.integer :num_rooms
      t.float :rate_person_day
      t.float :signal_value
      t.float :signal_date
      t.text :notes
      t.boolean :confirmed
      t.boolean :accomplished
      t.boolean :suspended

      t.timestamps
    end
  end
end
