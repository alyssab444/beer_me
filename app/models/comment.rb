class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :content, presence: true
  validates :content, length: {maximum: 250} too_long: "%{count} characters is the maximum allowed" }
end
