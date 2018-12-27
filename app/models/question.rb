class Question < Message
  has_many :answer_questions, dependent: :destroy
  has_many :answers, through: :answer_questions
end
