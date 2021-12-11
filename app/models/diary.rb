class Diary < ApplicationRecord
  belongs_to :member
  has_many :dia_images, dependent: :destroy
  accepts_attachments_for :dia_images, attachment: :image
  
  #画像投稿許可：refile使用
  #attachment :image
  
  
end
