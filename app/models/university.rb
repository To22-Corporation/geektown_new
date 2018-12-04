class University < ApplicationRecord
  has_many :profile, dependent: :destroy
end
