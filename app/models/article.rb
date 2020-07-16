class Article < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :article_categories, foreign_key: 'article_id'
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, foreign_key: 'article_id', class_name: 'Vote', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_presence_of :title, :text, :author_id, :image
  validates_length_of :title, :text, { minimum: 5 }

  mount_uploader :image, ImageUploader

  def self.featured_article
    article_id = Vote.group(:article_id).count.max_by { |_k, v| v }.first
    Article.find(article_id)
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
