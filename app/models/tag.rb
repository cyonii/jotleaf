class Tag < ApplicationRecord
  belongs_to :jot
  belongs_to :category
end
