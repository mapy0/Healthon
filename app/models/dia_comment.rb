class DiaComment < ApplicationRecord
  belongs_to :member
  belongs_to :diary
  validates :comment, presence: true
end
