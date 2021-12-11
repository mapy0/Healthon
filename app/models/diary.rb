class Diary < ApplicationRecord
  belongs_to :member
  has_many :dia_images, dependent: :destroy
  
　 #画像投稿許可：refile使用
  attachment :image
  
end
