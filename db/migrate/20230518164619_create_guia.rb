class CreateGuia < ActiveRecord::Migration[7.0]
  def change
    create_table :guia do |t|
      t.string :Nome_do_guia
      t.string :Telefone
      t.string :CPF
      t.string :CNPJ
      t.string :Cidade
      t.string :US

      t.timestamps
    end
  end
end
