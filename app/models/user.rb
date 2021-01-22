class User < ApplicationRecord
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: 'must not contain spaces' }

  has_many :jots, foreign_key: :author_id, dependent: :destroy
  has_many :votes, dependent: :destroy
end
