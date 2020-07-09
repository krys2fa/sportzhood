class User < ApplicationRecord
  has_many :articles, foreign_key: 'AuthorId', class_name: 'Article'
  has_many :votes, foreign_key: 'UserId', class_name: 'Vote', dependent: :destroy

  validates :Name, :email, presence: true
  validates :email, length: { minimum: 12 }
  validates :Name, length: { minimum: 3 }
end