class GroupsController < ApplicationController
  before_action :owner?, only: %i[edit update destroy]

  skip_before_action :require_profile, only: %i[index show]

  def new
    @skills = Skill.all
    @group = Group.new
    @group.group_skills.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.build_ownership(user_id: current_user.id).save
      redirect_to({ action: 'edit', id: @group.id }, notice: 'グループを作成しました')
    else
      render :new
    end
  end

  def edit
    @skills = Skill.all
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
    @groups = Group.all
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
