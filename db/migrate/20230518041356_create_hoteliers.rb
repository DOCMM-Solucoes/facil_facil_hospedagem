class CreateHoteliers < ActiveRecord::Migration[7.0]
  def change
    create_table :hoteliers do |t|
      t.string :name
      t.string :cpf
      t.string :phone_number
      t.string :plan

      t.timestamps
    end
  end
end
