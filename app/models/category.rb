class Category < ApplicationRecord
  has_many :category_articles, foreign_key: 'CategoryId'
  has_many :articles, through: :category_articles, dependent: :destroy

  validates_presence_of :Name, :Priority
  validates_length_of :Name, { minimum: 4 }
end
