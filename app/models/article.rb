class Article < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
  has_many :category_articles, foreign_key: 'ArticleId'
  has_many :categories, through: :category_articles, dependent: :destroy
  has_many :votes, foreign_key: 'ArticleId', class_name: 'Vote', dependent: :destroy

end
