namespace 'twoz', (exports, top) ->
  class Game
    @config:
      map_settings: {}

    current_position: {x: 0, y: 0}

    handle_worker_error: (error) =>
      console.debug("WORKER ERROR: #{error.message}")

    initialize_backend_worker: =>
      @worker = new Worker 'javascripts/lib/worker/worker.map.js'
      @worker.onmessage = @handle_map_update
      @worker.onerror = @handle_worker_error

    handle_map_update: (event) =>
      console.debug(event.data)

    tile_id: (x_pos, y_pos) =>
      "x#{@current_position.x + x_pos}y#{@current_position.y + y_pos}"

    tile_row: (y_pos) ->
      res = (@tile_id(x_pos, y_pos) for x_pos in [-1..1])
      console.debug res
      res

    visible_tiles: ->
      visible_tiles = []
      for y_pos in [-1..1]
        visible_tiles.push @tile_row(y_pos)...
      visible_tiles

    render_visible_map: ->
      @worker.postMessage { tiles: @visible_tiles() }

    run: =>
      console.debug('run game ...')
      @initialize_backend_worker()
      @render_visible_map()

  exports.game = new Game()
