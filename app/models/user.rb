class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :profile, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :groups, through: :participations

  has_many :message_participations, through: :participations
  has_many :messages, through: :message_participations

  has_many :ownerships, ->(user) { where(is_owner: true, user_id: user.id) }, inverse_of: :group, dependent: :destroy, class_name: "Participation"
  has_many :owning_groups, through: :ownerships, source: :group

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true,
                       presence: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
