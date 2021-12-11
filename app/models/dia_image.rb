class DiaImage < ApplicationRecord
  belongs_to :diary

  # 画像アップロードのための記述
  # mount_uploader :dia_image_id, ImageUploader
  
  #画像投稿許可：refile使用
  attachment :image
  
  
end
