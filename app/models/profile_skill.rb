class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill, inverse_of: :profile_skills

  validates :level, presence: true, inclusion: { in: 1..5 }
  validates :profile, presence: true
  validates :skill_id, presence: true
end
