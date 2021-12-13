class RemoveImageIdFromRecImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :rec_images, :image_id, :string
  end
end
