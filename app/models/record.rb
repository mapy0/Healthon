class Record < ApplicationRecord
  belongs_to :member
  has_many :workouts, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :rec_images, dependent: :destroy
  accepts_attachments_for :rec_images, attachment: :image
end
