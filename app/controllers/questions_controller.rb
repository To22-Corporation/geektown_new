class QuestionsController < ApplicationController
  def index
    @skills = Skill.all
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def message_params
    params.require(:chat).permit(
      :content,
      :type
    )
  end
end
