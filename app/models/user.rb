class User < ApplicationRecord
  has_many :questions
  has_many :answers

  validates :username, presence: true
  validates :username, uniqueness: true
end
