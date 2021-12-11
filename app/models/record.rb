class Record < ApplicationRecord
  belongs_to :member
  has_many :rec_images, dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :meals, dependent: :destroy
end
