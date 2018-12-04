class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :university
  belongs_to :faculty
end
