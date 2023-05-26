class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :guide
      t.string :phone
      t.string :cpf
      t.string :enterprise
      t.string :cnpj
      t.string :city
      t.string :uf

      t.timestamps
    end
  end
end
