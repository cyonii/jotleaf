class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :jot

  validates :user_id, uniqueness: { scope: :jot_id }
end
