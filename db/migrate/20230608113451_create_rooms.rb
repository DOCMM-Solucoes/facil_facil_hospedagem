class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :reference
      t.integer :maximum_capacity
      t.string :status
      t.string :photo_1
      t.string :photo_2
      t.string :photo_3
      t.string :photo_4
      t.boolean :is_double
      t.boolean :is_triple
      t.boolean :is_quadruple
      t.boolean :is_quintuple
      t.boolean :is_sextuple
      t.boolean :is_single
      t.boolean :is_couple
      t.boolean :is_couple_plus_one
      t.boolean :is_couple_plus_two
      t.boolean :is_couple_plus_three
      t.boolean :is_couple_plus_four
      t.boolean :is_two_couples
      t.boolean :is_two_couples_plus_one
      t.boolean :is_two_couples_plus_two
      t.boolean :is_three_couples

      t.timestamps
    end
  end
end
