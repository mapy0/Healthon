class CreateDiaGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :dia_goods do |t|
    t.integer :member_id, null: false
    t.integer :diary_id, null: false

      t.timestamps
    end
  end
end
