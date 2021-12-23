class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
