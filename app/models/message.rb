class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :content, presence: true
  after_commit :send_message_async, :display_notification

  def send_message_async
    MessageWorker.perform_async(id)
  end

  def display_notification
    NotificationWorker.perform_async(id)
  end
end
