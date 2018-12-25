class GroupSkill < ApplicationRecord
  belongs_to :group
  belongs_to :skill

  validates :group, presence: true
  validates :skill, presence: true
  validate :check_level

  def check_level
    errors.add(:skill, 'スキルレベルは1以上5以下で選択してください') unless 1..5.include?(level)
  end
end
