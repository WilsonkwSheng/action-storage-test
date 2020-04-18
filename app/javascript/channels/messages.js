import chatrooms from "./chatrooms"

$(document).on('turbolinks:load', function () {
  chatrooms.subscriptions.create("MessagesChannel", {
    received: function(data) {
      $("#messages").removeClass('hidden')
      return $('#messages').append(this.renderMessage(data));
    },
  
    renderMessage: function(data) {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
  });
})