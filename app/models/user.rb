class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, foreign_key: 'AuthorId', class_name: 'Article'
  has_many :votes, foreign_key: 'UserId', class_name: 'Vote', dependent: :destroy

  # validates_presence_of :email, length: { minimum: 6, maximum: 20 }
  validates_presence_of :Name, length: { minimum: 4 }
end
