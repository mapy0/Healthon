class CreateAims < ActiveRecord::Migration[5.2]
  def change
    create_table :aims do |t|
      t.float "aim_w"
      t.float "aim_bf"
      t.float "aim_mus"
      t.float "aim_sm"

      t.timestamps
    end
  end
end
