class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id', class_name: 'Article'
  has_many :votes, foreign_key: 'user_id', class_name: 'Vote', dependent: :destroy

  validates :name, :email, presence: true
  validates :email, length: { minimum: 12 }
  validates :name, length: { minimum: 3 }
end
