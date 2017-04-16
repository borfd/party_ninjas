App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: "Lobby" },
  connected: ->
    i = 0

  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    console.log(data)
    html = @createLine(data)
    $("[data-chat-room='Lobby']").append(html)

  createLine: (data) ->
    """
    <article>
      <span class="speaker">#{data['sent_by']}</span>
      <span class="body">#{data['body']}</span>
    </article>
    """

  send_message: (body, room) ->
    App.chatChannel.send({ sent_by: "Paul", body: body, room: room })
    @perform 'send_message', body: body, room: room

