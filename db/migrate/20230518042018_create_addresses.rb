class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :hotelier, null: false, foreign_key: true
      t.references :establishment, null: false, foreign_key: true
      t.references :guide, null: false, foreign_key: true
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
