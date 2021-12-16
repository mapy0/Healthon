class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  #画像投稿許可：refile使用
  attachment :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
 
 #Member情報モデル関連付け        
  has_one :profile
  has_one :aim

 #Record関連アソシエーション
  has_many :records, dependent: :destroy
  has_many :my_meals, dependent: :destroy
  
  #Diary関連アソシエーション
  has_many :diaries, dependent: :destroy
  
  #Circle関連アソシエーション
  has_many :circles, through: :circle_members
  
         
  #ログイン時に退会済みMemberが同一アカウントでログイン出来ないよう制約。
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
  
  
         
         
end
