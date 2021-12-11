class AddImagesToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :images, :json
  end
end
