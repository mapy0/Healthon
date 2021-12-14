class Record < ApplicationRecord
  belongs_to :member
  has_many :workouts, dependent: :destroy
  has_many :meals, dependent: :destroy
  accepts_nested_attributes_for :meals, allow_destroy: true
  has_many :rec_images, dependent: :destroy
  accepts_attachments_for :rec_images, attachment: :image


end
