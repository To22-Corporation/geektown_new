class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :message_participations, dependent: :nullify
  has_many :messages, through: :message_participations

  validates :user, presence: true
  validates :group, presence: true
  validate :check_level

  def check_level
    group_skills = group.group_skills
    profile_skills = user.profile.profile_skills
    group_skills.each do |group_skill|
      profile_skill = profile_skills.find_by(skill_id: group_skill.skill_id)
      errors.add(:skill, ": スキルレベルが足りません") unless profile_skill && profile_skill.level >= group_skill.level
    end
  end
end
