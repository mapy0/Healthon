class Diary < ApplicationRecord
  belongs_to :member
  has_many :dia_comments, dependent: :destroy
  has_many :dia_goods, dependent: :destroy
  has_many :dia_images, dependent: :destroy
  accepts_attachments_for :dia_images, attachment: :image
  
  def gooded_by?(member)
    dia_goods.where(member_id: member.id).exists?
  end

  
  
end
