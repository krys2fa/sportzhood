class Category < ApplicationRecord
  has_many :category_articles, foreign_key: 'CategoryId'
  has_many :articles, through: :category_articles, dependent: :destroy
end
