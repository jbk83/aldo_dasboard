import consumer from "channels/consumer"

consumer.subscriptions.create("CellChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to cell  ")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const selector = `[data-store-id="${data['store_id']}"][data-item-id="${data['item_id']}"]`
    const cell = document.querySelector(selector)
    cell.innerText = data.inventory
  }
});
