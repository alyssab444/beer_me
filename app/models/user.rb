class User < ApplicationRecord
  has_secure_password
  has_many :created_beers, foreign_key: 'creator_id', class_name: 'Beer'
  has_many :comments
  has_many :commented_beers, through: :comments, source: 'Beer'

  validates :username, :email, presence: true
  validates :username, :email, uniqueness:true
end
