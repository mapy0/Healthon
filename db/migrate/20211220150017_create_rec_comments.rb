class CreateRecComments < ActiveRecord::Migration[5.2]
  def change
    create_table :rec_comments do |t|
    t.integer :member_id, null: false
    t.integer :record_id, null: false
    t.text :comment
      t.timestamps
    end
  end
end
