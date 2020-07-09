class Category < ApplicationRecord
  has_many :article_categories, foreign_key: 'CategoryId'
  has_many :articles, through: :article_categories, dependent: :destroy

  validates_presence_of :Name, :Priority
  validates_length_of :Name, { minimum: 4 }
end
