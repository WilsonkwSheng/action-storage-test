# frozen_string_literal: true
class NotificationWorker
  include Sidekiq::Worker

  def perform(id)
    message = Message.find_by(id: id)
    current_time = convert_to_local_time(message.created_at)
    ActionCable.server.broadcast(
      'notifications',
      notifications_count: Message.count,
      message: message,
      chatroom_name: message.chatroom.topic,
      created_at: current_time,
    )
  end

  def convert_to_local_time(time)
    # Will need to get country from User with geocoder
    local_time = Time.use_zone('Kuala Lumpur') { time }
    local_time.strftime('%d %b %Y %I:%M:%S %P')
  end
end
