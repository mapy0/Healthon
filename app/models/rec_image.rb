class RecImage < ApplicationRecord
  belongs_to :record, foreign_key: true
  
  #画像投稿許可：refile使用
  attachment :image
  
end
