class Message < ApplicationRecord
  enum type: { Chat: 0, Question: 1 }

  has_one :message_participation, dependent: :destroy
  has_one :participation, through: :message_participation
  has_one :user, through: :participation
  has_one :group, through: :participation

  validates :content, presence: true, length: { minimum: 1 }
end
