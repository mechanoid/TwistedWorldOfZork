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
      try
        throw event.data.exception if event.data.exception?
        twoz.game_renderer.paint_map(event.data.tiles)
      catch
        console.error 'REDIS CONNECTION FAILED: please run redis'

    tile_id: (x_pos, y_pos) =>
      "x#{@current_position.x + x_pos}y#{@current_position.y + y_pos}"

    tile_row: (y_pos) ->
      (@tile_id(x_pos, y_pos) for x_pos in [-1..1])

    visible_tiles: ->
      visible_tiles = []
      for y_pos in [-1..1]
        visible_tiles.push @tile_row(y_pos)...
      visible_tiles

    lookup_visible_map: ->
      @worker.postMessage { tiles: @visible_tiles() }

    modify_starting_position: ->
      @current_position.x = Math.floor(Math.random() * 5)
      @current_position.y = Math.floor(Math.random() * 5)

    run: =>
      console.debug('run game ...')
      @initialize_backend_worker()
      @modify_starting_position()
      @lookup_visible_map()

  exports.game = new Game()
