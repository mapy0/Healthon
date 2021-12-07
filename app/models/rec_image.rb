class RecImage < ApplicationRecord
  belongs_to :record, foreign_key: true
end
