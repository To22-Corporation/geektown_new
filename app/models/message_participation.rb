class MessageParticipation < ApplicationRecord
  belongs_to :message
  belongs_to :participation, optional: true
end
