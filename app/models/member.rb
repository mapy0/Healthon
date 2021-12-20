class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #画像投稿許可：refile使用
  attachment :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true

  #ログイン時に退会済みMemberが同一アカウントでログイン出来ないよう制約。
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end


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
  has_many :cir_comments, dependent: :destroy

  #Community関連アソシエーション
  belongs_to :community, optional: true


  #Follow関連アソシエーションと定義
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow #自身がFollowしているMember
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :member#自身がFollowされているMember



  def follow(other_member)
    #フォローしようとしているのが自分ではないか？
    #self には member.follow(other) を実行でmemberが代入さる。＝実行した Member のインスタンスがself 。
    unless self == other_member
    #見つかれば Relation を返し、見つからなければ 下記 としてフォロー関係を保存(new + save)できる。
    #これでフォローが重複して保存されることがなくなる。
      self.relationships.find_or_create_by(follow_id: other_member.id)
    end
  end



  def unfollow(other_member)
    relationship = self.relationships.find_by(follow_id: other_member.id)
    #relationship があれば destroyする。
    relationship.destroy if relationship
  end

  def following?(other_member)
    self.followings.include?(other_member)
    #self.followings によりフォローしている Member達を取得、
    #include?(other_member) によって other_member が含まれていないかを確認。含まれていたらtrue を返し、なければfalse を返す
  end




end
