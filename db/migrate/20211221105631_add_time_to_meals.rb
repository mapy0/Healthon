class AddTimeToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :time, :time
  end
end
