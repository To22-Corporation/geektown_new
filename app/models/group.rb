class Group < ApplicationRecord
  has_many :group_skills, dependent: :destroy
  has_many :skills, through: :group_skills
  accepts_nested_attributes_for :group_skills, allow_destroy: true, reject_if: :all_blank

  has_one :ownership, -> { where(is_owner: true).limit(1) }, inverse_of: :group, dependent: :destroy, class_name: "Participation"
  has_one :owner, through: :ownership, source: :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  has_many :message_participations, through: :participations
  has_many :messages, through: :message_participations
  has_many :last_message, -> { where.not(type: 'Answer').order(created_at: "DESC").limit(1) }, through: :message_participations, source: :message

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  # validates :close_at, presence: true, unless: :is_master
  validate :check_limit_number

  def check_limit_number
    errors.add(:skill, 'スキルレベルは1以上5以下で選択してください') if !limited_number.nil? && limited_number < 1
  end

  attribute :close_at, :formatted_date, default: nil
end
