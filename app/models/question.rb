class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :title, length: { minimum: 20 }
  validates :body, presence: true
  validates :body, length: { minimum: 50 }
  validates :user_id, presence: true
end
