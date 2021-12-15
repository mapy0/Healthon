class MyMeal < ApplicationRecord
  
  has_many :meals
  belongs_to :member
  
end
