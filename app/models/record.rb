class Record < ApplicationRecord
  belongs_to :member
  has_many :rec_images
  
end
