class User < ApplicationRecord
  has_many :groups, foreign_key: 'user_id', dependent: :destroy
  has_many :payments, foreign_key: 'author_id', dependent: :destroy
  validates :name, presence: true, length: { in: 6..50 }

end
