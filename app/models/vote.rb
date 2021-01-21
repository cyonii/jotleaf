class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :jot_id }

  belongs_to :user
  belongs_to :jot
end
