class DiaImage < ApplicationRecord
  belongs_to :diary

 #画像投稿許可：refile使用
  attachment :image

end
