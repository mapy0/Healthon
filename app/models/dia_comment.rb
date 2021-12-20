class DiaComment < ApplicationRecord
  belongs_to :member
  belongs_to :diary
end
