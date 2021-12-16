class Circle < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :circle_members, dependent: :destroy
  has_many :members, through: :circle_members, dependent: :destroy
  has_many :cir_comments, dependent: :destroy
  
  accepts_nested_attributes_for :circle_members
  
  attachment :image
  
  
end
