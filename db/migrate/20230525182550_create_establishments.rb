class CreateEstablishments < ActiveRecord::Migration[7.0]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :qty_bedrooms
      t.string :phone
      t.string :site

      t.timestamps
    end
  end
end
