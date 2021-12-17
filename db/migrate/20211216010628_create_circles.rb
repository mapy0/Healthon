class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
    t.string :name, null: false
    t.text :infomation
    t.integer :owner_id
    t.integer :maximam_member
    t.string :image_id
    t.timestamps
    end
  end
end
