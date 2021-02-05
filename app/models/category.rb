class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :jots, through: :tags

  validates :name, :priority, presence: true
  validates :name, :priority, uniqueness: true

  def top_jot
    jots.joins(:votes).order('votes desc').limit(1)[0] or jots.last
  end
end
