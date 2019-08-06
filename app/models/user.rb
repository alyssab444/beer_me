class User < ApplicationRecord
  has_secure_password
  has_many :created_beers, foreign_key: 'creator_id', class_name: 'Beer'
  has_many :comments
  has_many :commented_beers, through: :comments, source: 'Beer'

  validates :username, :email, presence: true
  validates :username, :email, uniqueness:true

  def self.create_with_omniauth(auth_hash)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
        end
      end
end
