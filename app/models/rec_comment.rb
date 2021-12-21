class RecComment < ApplicationRecord
  belongs_to :member
  belongs_to :record
end
