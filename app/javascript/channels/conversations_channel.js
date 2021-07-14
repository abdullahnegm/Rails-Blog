import consumer from "./consumer"

consumer.subscriptions.create("ConversationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected Successfuly")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
    document.getElementById("conversation-body").insertAdjacentHTML('beforeend', `
                                  <p>${ data.message.body }</p>
                                  <p>at <strong>${ data.message.created_at }</strong><br>
                                    by <strong>${ data.user }</strong></p>
                                  <hr>
    `)
  }
});
