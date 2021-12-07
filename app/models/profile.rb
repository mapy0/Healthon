class Profile < ApplicationRecord
  validates :height, numericality: { only_integer: true }
  validates :birth, presence: true
  validates :age, numericality: { only_integer: true }
  belongs_to :member, optional: true

enum se: { sex_private: 0, male: 1, female: 2, others: 3 }
  
  
end
