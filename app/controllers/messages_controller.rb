class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = Message.new(message_params)
    message.user = current_user
    message.save
    if message.errors.present?
      flash[:error] = message.errors.full_messages.join(', ')
      redirect_to chatroom_path(message.chatroom_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
