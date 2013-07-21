namespace 'twoz', (exports, top) ->
  class LevelRenderer
    constructor: ->
      @initialize_canvas()

    initialize_canvas: ->
      @canvas = $('<canvas></canvas>')

      $('.screen.game').html(@canvas)


module.exports = new LevelRenderer()