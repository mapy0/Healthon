class RecComment < ApplicationRecord
  belongs_to :member
  belongs_to :record
  
  validates :score, numericality: { greater_than_or_equal_to: 0 }
  
end
