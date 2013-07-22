WebSocketServer = require('websocket').server
http = require('http')
util = require('util')

map = require('twoz').map

server = http.createServer (request, response) ->

server.listen 9999

ws = new WebSocketServer({httpServer: server})

ws.on "request", (request) ->
  console.log "SOCKET: request received"
  connection = request.accept null, request.origin

  connection.on "message", (message) ->

    message =
      try
        JSON.parse(message.utf8Data)
      catch
        message.utf8Data
#
    console.log util.inspect(message.tiles)

    map.find_tiles message.tiles..., (tiles) ->
      console.log 'callback called!'

      connection.sendUTF JSON.stringify(tiles)
