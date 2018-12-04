class Faculty < ApplicationRecord
  has_many :profile, dependent: :destroy
end
