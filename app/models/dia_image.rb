class DiaImage < ApplicationRecord
  belongs_to :diary

  # 画像アップロードのための記述
  mount_uploader :dir_image_id, ImageUploader
  
  
end
