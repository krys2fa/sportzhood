class Vote < ApplicationRecord
  belongs_to :user, foreign_key: 'UserId', class_name: 'User'
  belongs_to :article, foreign_key: 'ArticleId', class_name: 'Article'
end
