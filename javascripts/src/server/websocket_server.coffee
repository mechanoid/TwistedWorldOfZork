WebSocketServer = require('websocket').server
http = require('http')
util = require('util')
#map = require('map')

server = http.createServer (request, response) ->

server.listen 9999

ws = new WebSocketServer({httpServer: server})

ws.on "request", (request) ->
  console.log "request received."
  connection = request.accept null, request.origin

  connection.on "message", (message) ->

    message =
      try
        JSON.parse(message.utf8Data)
      catch
        message.utf8Data

    console.log util.inspect(message)
    connection.sendUTF JSON.stringify({ type: 'color', data: "userColor" })
#    if message.type is 'utf-8'
#      console.log message.utf8Data.toString()