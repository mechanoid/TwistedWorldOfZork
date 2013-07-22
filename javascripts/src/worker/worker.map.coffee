class MapWorker
  constructor: ->
    @socket = new WebSocket "ws://127.0.0.1:9999/"
#    postMessage 'connecting to websocket ...'

    @socket.onmessage = (message) ->
      postMessage JSON.parse(message.data)


  handle_message: (event) =>
    # TODO: at the moment we only retrieve update requests like {tiles: [x0y01, x0y1, ...]}, this may change
    @socket.onopen = =>
      @socket.send JSON.stringify(event.data)

worker = new MapWorker()

@addEventListener "message", worker.handle_message


