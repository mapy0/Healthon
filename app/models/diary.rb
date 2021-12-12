class Diary < ApplicationRecord
  belongs_to :member
  has_many :dia_images, dependent: :destroy
  accepts_attachments_for :dia_images, attachment: :image
  
  
end
