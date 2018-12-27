class Questions::AnswersController < ApplicationController
  before_action :participated?, only: %i[create]

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      participation = current_user.participations.where(group: @question.group).first
      participation.messages << @answer if participation
      @question.answers << @answer
    end
    redirect_to question_path(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(
      :content,
      :type
    )
  end

  def participated?
    redirect_to question_path(params[:question_id]) unless current_user.group_ids.include?(Question.find(params[:question_id]).group.id)
  end
end
