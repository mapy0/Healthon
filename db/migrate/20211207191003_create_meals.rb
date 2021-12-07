class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :record_id, null: false
      t.date:date, null: false
      t.string:name, null: false
      t.integer :calorie, null: false

      t.timestamps
    end
  end
end
