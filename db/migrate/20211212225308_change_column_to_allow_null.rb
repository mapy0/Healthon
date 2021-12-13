class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change

   def up
    change_column :rec_images, :image_id,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :rec_images, :image_id,:string, null: false
  end

  end
end
