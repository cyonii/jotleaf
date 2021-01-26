class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :priority, uniqueness: true

  has_many :tags, dependent: :destroy
  has_many :jots, through: :tags

  def top_jot
    jots.max_by { |jot| jot.votes.count }
  end
end
