class Jot < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  has_many :votes, dependent: :destroy

  validates :title, :text, :image, :categories, presence: true
end
