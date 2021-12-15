class Meal < ApplicationRecord
  belongs_to :record
  belongs_to :my_meal, optional: true
end
