class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      current_user.participations.create(group_id: @group.id, is_owner: true)
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
end
