class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill, inverse_of: :profile_skills

  validates :level, presence: true, inclusion: { in: 1..5 }
  validates :profile, presence: true
  validates :skill_id, presence: true

  validate :check_level

  def check_level
    errors.add(:skill, 'スキルレベルは1以上5以下で選択してください') unless (1..5).include?(level)
  end
end
