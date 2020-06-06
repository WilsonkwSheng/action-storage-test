import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#notifications').html(`<p>You got new message in ${data.chatroom_name} at ${data.created_at}</p>`)
    setTimeout(function() {
      $('#notifications').html('');
    }, 2000);
  },
});
