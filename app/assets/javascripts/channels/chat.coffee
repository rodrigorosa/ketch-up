#App.chat = App.cable.subscriptions.create "ChatChannel",
  #connected: ->
    # Called when the subscription is ready for use on the server

  #disconnected: ->
    # Called when the subscription has been terminated by the server

  #received: (data) ->
    # Called when there's incoming data on the websocket for this channel

window.change_chat = (id, type, team_id) ->
  if App.chat != undefined
    App.chat.unsubscribe()

  App.chat = App.cable.subscriptions.create { channel: "ChatChannel", id: id , type: type, team_id: team_id},
    received: (data) ->
      window.add_message(data.message, data.date, data.name)
