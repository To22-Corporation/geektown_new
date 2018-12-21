class Message < ApplicationRecord
  has_one :message_participation, dependent: :destroy
  has_one :participation, through: :message_participation
  has_one :user, through: :participation

  validates :content, presence: true, length: { minimum: 1 }
end
