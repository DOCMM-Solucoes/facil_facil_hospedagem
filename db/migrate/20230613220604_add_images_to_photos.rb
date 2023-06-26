class AddImagesToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :images, :json
  end
end
