class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :university
  belongs_to :faculty
  has_many :profile_skills, dependent: :destroy
  has_many :skills, through: :profile_skills
end
