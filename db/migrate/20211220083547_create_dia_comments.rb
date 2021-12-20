class CreateDiaComments < ActiveRecord::Migration[5.2]
  def change
    create_table :dia_comments do |t|
    t.integer :member_id, null: false
    t.integer :diary_id, null: false
    t.text :comment
      t.timestamps
    end
  end
end
