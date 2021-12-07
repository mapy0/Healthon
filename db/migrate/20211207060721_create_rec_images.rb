class CreateRecImages < ActiveRecord::Migration[5.2]
  def change
    create_table :rec_images do |t|
      t.integer :record_id, null: false
      t.integer :image_id, null: false      

      t.timestamps
    end
  end
end
