class CreateRecGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :rec_goods do |t|
    t.integer :member_id, null: false
    t.integer :record_id, null: false

      t.timestamps
    end
  end
end