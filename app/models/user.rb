class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :profile, dependent: :destroy
  has_many :group_skills, dependent: :destroy
  has_many :groups, through: :group_skills

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true,
                       presence: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
