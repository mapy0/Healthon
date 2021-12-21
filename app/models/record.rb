class Record < ApplicationRecord
  belongs_to :member
  has_many :rec_comments, dependent: :destroy
  has_many :rec_goods, dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :rec_images, dependent: :destroy
  
  accepts_nested_attributes_for :meals, allow_destroy: true
  accepts_nested_attributes_for :workouts, allow_destroy: true
  accepts_attachments_for :rec_images, attachment: :image
  
  def gooded_by?(member)
    rec_goods.where(member_id: member.id).exists?
  end
  

  def get_date_current
    Date.current
  end
end
