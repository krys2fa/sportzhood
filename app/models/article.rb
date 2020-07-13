class Article < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
  has_many :article_categories, foreign_key: 'ArticleId'
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, foreign_key: 'ArticleId', class_name: 'Vote', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :Title, :Text, :AuthorId
  validates_length_of :Title, :Text, { minimum: 5 }

  mount_uploader :Image, ImageUploader

  def self.featured_article
    @articles = Article.all
    article_hash = {}
    @articles.each { |article| article_hash[article.id] = article.votes.size }
    max_value = article_hash.key(article_hash.values.max)
    Article.where(id: max_value).includes(:user)
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
