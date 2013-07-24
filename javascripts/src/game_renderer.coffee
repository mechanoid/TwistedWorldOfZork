namespace 'twoz', (exports, top) ->
  class GameRenderer
    settings:
      canvas:
        size: 540
    constructor: ->
      @initialize_canvas()

    initialize_canvas: ->
      canvas = $('<canvas></canvas>')
      $('.screen.game').html(canvas)

      canvas.width = @settings.canvas.size * 2
      canvas.height = @settings.canvas.size * 2

      @canvas = $('.screen.game canvas')[0]

      @canvas.style.width = "#{@settings.canvas.size}px"
      @canvas.style.height = "#{@settings.canvas.size}px"
      @ctx = @canvas.getContext("2d")


    paint_map: (tiles) ->
      console.debug 'paint map'
      @ctx.save()

      for x in [0..9]
        for y in [0..9]
          @ctx.drawImage(twoz.images['images/green.png'], x*30, y*15, 30, 15);


  exports.game_renderer = new GameRenderer()