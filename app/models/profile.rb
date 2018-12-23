class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Relations
  belongs_to :user
  belongs_to :university
  belongs_to :faculty
  has_many :profile_skills, dependent: :destroy, inverse_of: :profile
  has_many :skills, through: :profile_skills
  accepts_nested_attributes_for :profile_skills, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :user_id, presence: true
  validates :university_id, presence: true
  validates :faculty_id, presence: true
  validates :name, presence: true
end
