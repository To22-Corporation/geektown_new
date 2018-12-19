class GroupsController < ApplicationController
  before_action :owner?, only: %i[edit update]

  def new
    @group = Group.new
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

  private

  def group_params
    params.require(:group).permit(
      :name,
      :description,
      :limited_number,
      :close_at,
      group_skills_attributes: %i[id group_id level _destroy]
    )
  end

  def owner?
    redirect_to({ action: :new }, alert: '編集権限がありません') unless current_user.owning_group_ids.include?(params["id"].to_i)
  end
end
