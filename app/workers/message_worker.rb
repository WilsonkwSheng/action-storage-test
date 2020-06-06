# frozen_string_literal: true
class MessageWorker
  include Sidekiq::Worker

  def perform(id)
    message = Message.find_by(id: id)

    ActionCable.server.broadcast(
      'messages',
      message: message.content,
      user: message.user.email
    )
  end
end
