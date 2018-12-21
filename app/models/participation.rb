class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :message_participations, dependent: :destroy
  has_many :messages, through: :message_participations

  validates :user, presence: true
  validates :group, presence: true
end
