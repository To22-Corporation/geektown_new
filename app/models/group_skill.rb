class GroupSkill < ApplicationRecord
  belongs_to :group
  belongs_to :skill

  validates :group, presence: true
  validates :skill, presence: true
end
