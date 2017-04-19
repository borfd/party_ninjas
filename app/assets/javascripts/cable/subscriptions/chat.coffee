App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: "Lobby" },
  connected: ->
    @scrollToBottom()

  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    @scrollToBottom()
    $("textarea[name='body']").val("")
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

  scrollToBottom: ->
    $("[data-chat-room='Lobby']").animate({ scrollTop: $("[data-chat-room='Lobby']").prop("scrollHeight")}, 1000);

