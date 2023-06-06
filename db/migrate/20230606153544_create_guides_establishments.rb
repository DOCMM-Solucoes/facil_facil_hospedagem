class CreateGuidesEstablishments < ActiveRecord::Migration[7.0]
  def change
    create_table :guides_establishments do |t|
      t.belongs_to :guides
      t.belongs_to :establishments
      t.timestamps
    end
  end
end
