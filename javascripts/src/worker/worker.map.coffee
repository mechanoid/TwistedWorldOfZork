count = 0

ws = new WebSocket "ws://127.0.0.1:9999/"
postMessage { status: "connecting..." }

ws.onopen = ->
  postMessage {status: "connection established..." }
  ws.send 'hello, server!'

ws.onmessage = (message) ->
  count += 1
  unless count > 5
    message = JSON.parse(message.data)
    postMessage message
    ws.send JSON.stringify({received: message})

ws.send "connection initialized by me!"