class Groups::MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @users = @group.users
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      participation = current_user.participations.where(group_id: params["group_id"]).first
      participation.messages << @message if participation
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :content
    )
  end
end
