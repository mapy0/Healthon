class CreateMyMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :my_meals do |t|
    t.integer :member_id, null: false
    t.string :thing
    t.integer :calorie
    t.timestamps
    
    end
  end
end
