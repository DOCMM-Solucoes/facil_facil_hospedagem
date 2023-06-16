class DropGuidesEstablishments < ActiveRecord::Migration[7.0]
  def change
    drop_table :guides_establishments, if_exists: true
  end
end
