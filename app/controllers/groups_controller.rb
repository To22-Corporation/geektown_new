class GroupsController < ApplicationController
  before_action :owner?, only: %i[edit update destroy]

  skip_before_action :require_profile, only: %i[index show]

  def new
    set_master
    @group = Group.new
    @group.group_skills.build
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @group.build_ownership(user_id: current_user.id).save
      redirect_to("/groups/#{@group.id}/messages", notice: 'グループを作成しました')
    else
      set_master
      render :new
    end
  end

  def edit
    set_master
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to({ action: 'edit', id: @group.id }, notice: 'グループを編集しました')
    else
      render :update
    end
  end

  def index
    set_master
    @selected_skill_ids = params.has_key?("group") ? params["group"]["skill"] : []
    @selected_skill_ids.map!(&:to_i).reject! { |i| i <= 0 }
    if @selected_skill_ids.present?
      @groups = Group.includes(:skills).where(skills: { id: @selected_skill_ids })
    else
      @groups = Group.includes(:skills).all
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to(user_groups_path, notice: 'グループを削除しました')
    else
      render :show
    end
  end

  private

  def set_master
    @skills = Skill.all
  end

  def group_params
    params.require(:group).permit(
      :name,
      :description,
      :limited_number,
      :close_at,
      group_skills_attributes: %i[id skill_id level _destroy]
    )
  end

  def owner?
    redirect_to({ action: :new }, alert: '編集権限がありません') unless current_user.owning_group_ids.include?(params["id"].to_i)
  end
end
