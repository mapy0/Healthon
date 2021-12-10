class CreateDiaImages < ActiveRecord::Migration[5.2]
  def change
    create_table :dia_images do |t|
      t.integer :diary_id, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
