class AddMyMealIdToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :my_meal_id, :integer
  end
end
