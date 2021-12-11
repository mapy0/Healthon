class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.integer :member_id, null: false
      t.date :date, null: false
      t.string :title, null: false
      t.text :bo
      t.timestamps
    end
  end
end
