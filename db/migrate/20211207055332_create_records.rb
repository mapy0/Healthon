class CreateRecords < ActiveRecord::Migration[5.2]
  def change
   create_table :records do |t|
    t.integer :member_id, null: false
    t.float :weight
    t.float :bmi
    t.float :bf
    t.float :mm
    t.float :mus
    t.float :tbw
    t.float :sm
    
      t.timestamps
    end
  end
end
