class Group < ApplicationRecord
  has_many :group_skills, dependent: :destroy
  has_many :skills, through: :group_skills

  has_one :ownership, -> { where(is_owner: true).limit(1) }, inverse_of: :group, dependent: :destroy, class_name: "Participation"
  has_one :owner, through: :ownership, source: :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  has_many :message_participations, through: :participations
  has_many :messages, through: :message_participations

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :close_at, presence: true
  validates :limited_number, presence: true, numericality: { only_integer: true }

  attribute :close_at, :formatted_date, default: nil
end
