class Groups::MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @users = @group.users
  end

  private

  def message_params
    params.require(:message).permit(
      :content
    )
  end
end
