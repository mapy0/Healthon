class AddImageIdToRecImages < ActiveRecord::Migration[5.2]
  def change
    add_column :rec_images, :image_id, :string
  end
end
