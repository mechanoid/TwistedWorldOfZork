count = 0

ws = new WebSocket "ws://127.0.0.1:9999/"
postMessage { status: "connecting..." }

ws.onopen = ->
  postMessage {status: "connection established!!" }
  ws.send 'hi, server!!'

ws.onmessage = (message) ->
  count += 1
  unless count >  5
    postMessage {received: message.data}
    ws.send "#{message.data} ##{count}"

ws.send "connection initialized by me!"