class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true,
                       presence: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
