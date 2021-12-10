class Diary < ApplicationRecord
  belongs_to :member
  has_many  :dir_images, dependent: :destroy
  accepts_nested_attributes_for :dir_images, allow_destroy: true
end
