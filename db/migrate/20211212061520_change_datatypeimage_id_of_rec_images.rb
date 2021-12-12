class ChangeDatatypeimageIdOfRecImages < ActiveRecord::Migration[5.2]
  def change
    change_column :rec_images, :image_id, 'string'
  end
end
