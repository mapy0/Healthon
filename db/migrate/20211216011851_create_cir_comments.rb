class CreateCirComments < ActiveRecord::Migration[5.2]
  def change
    create_table :cir_comments do |t|
    t.integer :member_id, null: false
    t.integer :circle_id, null: false
    t.text :comment
    
    t.timestamps
    end
  end
end
