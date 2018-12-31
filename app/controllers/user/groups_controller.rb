class User::GroupsController < ApplicationController
  skip_before_action :require_profile, only: %i[index]

  def index
    @groups = current_user.groups
  end

  def create
    @group = Group.find(params[:group][:id])

    if (@group.limited_number.nil? || @group.users.count < @group.limited_number) && current_user.groups << @group
      redirect_to(group_messages_path(@group.id), notice: 'グループに参加しました')
    else
      redirect_to(user_groups_path, notice: 'グループに参加できませんでした')
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
