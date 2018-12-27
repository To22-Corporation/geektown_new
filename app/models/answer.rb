class Answer < Message
  has_one :answer_question, dependent: :destroy
  has_one :question, through: :answer_questions
end
