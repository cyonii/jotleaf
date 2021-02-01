class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :jots, through: :tags

  validates :name, :priority, presence: true
  validates :name, :priority, uniqueness: true

  def top_jot
    jots.max_by { |jot| jot.votes.count }
  end
end
