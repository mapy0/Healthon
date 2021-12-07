class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
         
  has_one :profile
  has_one :aim
         
  #ログイン時に退会済みMemberが同一アカウントでログイン出来ないよう制約。
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
  
  
         
         
end
