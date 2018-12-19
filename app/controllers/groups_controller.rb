class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to({ action: 'edit', id: @group.id }, notice: '更新完了しました')
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
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
