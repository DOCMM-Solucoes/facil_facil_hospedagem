class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :guide
      t.string :phone
      t.string :cpf
      t.string :address
      t.string :cep
      t.string :city
      t.string :uf
      t.string :enterprise

      t.timestamps
    end
  end
end
