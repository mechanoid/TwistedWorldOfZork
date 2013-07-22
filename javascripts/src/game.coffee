namespace 'twoz', (exports, top) ->
  class Game
    @config:
      map_settings: {}

    handle_map_update: (event) =>
      console.debug(event.data)

    handle_worker_error: (error) =>
      console.debug("WORKER ERROR: #{error.message}")

    run: ->
      console.debug('run game ...')
      worker = new Worker 'javascripts/lib/worker/worker.map.js'
      worker.onmessage = @handle_map_update
      worker.onerror = @handle_worker_error
      worker.postMessage { tiles: ['x0y0', 'x0y1', 'x1y0', 'x1y1'] }

  exports.game = new Game()
