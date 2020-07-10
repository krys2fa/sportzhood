class Article < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
  has_many :article_categories, foreign_key: 'ArticleId'
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, foreign_key: 'ArticleId', class_name: 'Vote', dependent: :destroy

  validates_presence_of :Title, :Text, :AuthorId
  validates_length_of :Title, :Text, { minimum: 5}

  def self.get_featured_article
    @articles    = Article.all
    article_hash = {}
    @articles.each {|article| article_hash[article.id] = article.votes.size }
    max_value = article_hash.key(article_hash.values.max)
    Article.where(id: max_value).includes(:user)
  end
end
