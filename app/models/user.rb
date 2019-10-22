class User < ApplicationRecord
  has_secure_password
  has_many :created_beers, foreign_key: 'creator_id', class_name: 'Beer'
  has_many :comments
  has_many :commented_beers, through: :comments, source: 'Beer'

  validates :email, presence: true
  validates :email, uniqueness:true

  def self.find_or_create_by_omniauth(auth_hash)
        where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
          user.email = auth_hash.info.email || auth_hash.info.nickname
          user.password = SecureRandom.hex
        end
      end
    end
