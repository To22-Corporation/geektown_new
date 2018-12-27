class QuestionsController < ApplicationController
  skip_before_action :require_profile, only: %i[index show]

  def index
    @skills = Skill.all
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private

  def message_params
    params.require(:chat).permit(
      :content,
      :type
    )
  end
end
