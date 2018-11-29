class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, presence: true
  validates :password, confirmation: true,
                       presence: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, presence: true
  validates :age, inclusion: 1..100, presence: true
  validates :university_id, presence: true
  validates :faculty_id, presence: true
end
