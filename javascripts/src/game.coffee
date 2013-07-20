namespace 'twoz', (exports, top) ->
  class Game
    @config:
      map_settings: {}

    handle_map_update: (event) =>
      console.debug(event.data)



    run: ->
      worker = new Worker 'javascripts/lib/worker/worker.map.js'
      worker.onmessage = @handle_map_update
      worker.postMessage "Can you hear me?"





  exports.game = new Game()
