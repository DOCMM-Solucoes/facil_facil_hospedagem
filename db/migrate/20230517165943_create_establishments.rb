class CreateEstablishments < ActiveRecord::Migration[7.0]
  def change
    create_table :establishments do |t|
      t.string :name
      t.integer :qty_bedrooms
      t.string :address
      t.integer :cep
      t.string :city
      t.string :state
      t.integer :phone
      t.string :site
      t.string :owner
      t.integer :cpf

      t.timestamps
    end
  end
end
