class AddHotelierToEstablishments < ActiveRecord::Migration[7.0]
  def change
    add_reference :establishments, :hotelier, null: false, foreign_key: true
  end
end
