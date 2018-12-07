class Group < ApplicationRecord
  has_many :group_skills, dependent: :destroy
  has_many :skills, through: :group_skills

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  validates :name, presence: true, uniqueness: true
end
