class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :name
      t.string :phone
      t.string :cpf
      t.string :company
      t.string :cnpj

      t.timestamps
    end
  end
end
