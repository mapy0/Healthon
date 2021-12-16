class CreateCircleMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_members do |t|
    t.integer :member_id, null: false
    t.integer :circle_id, null: false
    t.timestamps
    end
  end
end
