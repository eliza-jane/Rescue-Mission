class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true
  validates :body, length: { minimum: 50 }
end
