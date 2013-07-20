WebSocketServer = require('websocket').server
http = require('http')

server = http.createServer (request, response) ->

server.listen 9999

ws = new WebSocketServer({httpServer: server})

ws.on "request", (request) ->
  connection = request.accept null, request.origin

  connection.on "message", (message) ->
    console.log message.utf8Data
    connection.send message.utf8Data
#    if message.type is 'utf-8'
#      console.log message.utf8Data.toString()