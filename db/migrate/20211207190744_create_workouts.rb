class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :record_id, null: false
      t.date:date, null: false
      t.string:name, null: false
      t.integer :burned_calorie, null: false

      t.timestamps
    end
  end
end
