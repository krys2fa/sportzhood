class CategoryArticle < ApplicationRecord
  belongs_to :category, foreign_key: 'CategoryId', class_name: 'Category'
  belongs_to :article, foreign_key: 'ArticleId', class_name: 'Article'

end
