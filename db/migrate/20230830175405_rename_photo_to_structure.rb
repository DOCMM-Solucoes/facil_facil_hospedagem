class RenamePhotoToStructure < ActiveRecord::Migration[7.0]
  def change
    rename_table :photos, :structures
  end
end
