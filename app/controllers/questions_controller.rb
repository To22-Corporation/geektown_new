class QuestionsController < ApplicationController
  skip_before_action :require_profile, only: %i[index show]

  def index
    @skills = Skill.all
    @selected_skill_ids = params.has_key?("question") ? params["question"]["skill"] : []
    @selected_skill_ids.map!(&:to_i).reject! { |i| i <= 0 }
    @questions = Question.includes(group: :skills).where(skills: { id: @selected_skill_ids.presence || @selected_skill_ids.present? ? @selected_skill_ids : @skills.map(&:id) })
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
