class User::GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def create
    @group = Group.find(params[:group][:id])
    if current_user.groups << @group
      redirect_to(user_groups_path, notice: 'グループから退出しました')
    else
      redirect_to(user_groups_path, notice: 'グループから退出できませんでした')
    end
  end

  def destroy
    @participation = current_user.participations.find_by(group_id: params[:id])
    if @participation.destroy
      redirect_to(group_path(params[:id]), notice: 'グループから退出しました')
    else
      redirect_to(group_path(params[:id]), notice: 'グループから退出できませんでした')
    end
  end
end
