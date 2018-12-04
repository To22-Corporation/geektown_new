class Profile < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :university
  belongs_to :faculty
  has_many :profile_skills, dependent: :destroy
  has_many :skills, through: :profile_skills

  # Validations
  validates :user_id, presence: true
  validates :university_id, presence: true
  validates :faculty_id, presence: true
  validates :name, presence: true
end
