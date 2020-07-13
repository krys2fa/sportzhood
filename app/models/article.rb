class Article < ApplicationRecord
  belongs_to :user, foreign_key: 'AuthorId', class_name: 'User'
  has_many :article_categories, foreign_key: 'ArticleId'
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, foreign_key: 'ArticleId', class_name: 'Vote', dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :Title, :Text, :AuthorId
  validates_length_of :Title, :Text, { minimum: 5 }
  # validate :image_size_validation

  mount_uploader :Image, ImageUploader

  def self.featured_article
    @articles = Article.all
    article_hash = {}
    @articles.each { |article| article_hash[article.id] = article.votes.size }
    max_value = article_hash.key(article_hash.values.max)
    Article.where(id: max_value).includes(:user)
  end


  private
  # def image_size_validation
    # errors[:Image] << "should be less than 500KB" if Image.size > 0.5.megabytes
    # errors.add(:Image, 'should be less than 500KB') if Image.size > 0.5.megabytes
  # end
end
