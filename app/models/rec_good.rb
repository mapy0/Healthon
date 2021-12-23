class RecGood < ApplicationRecord
  belongs_to :member
  belongs_to :record
  validates :comment, presence: true
end
