class RemoveImagesFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :images, :json
  end
end
