class Record < ApplicationRecord
  belongs_to :member
  has_many :rec_images
  has_many :workouts
  has_many :meals
end
