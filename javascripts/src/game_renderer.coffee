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

      imageObj = new Image()
      imageObj.onload = =>
        for x in [0..9]
          for y in [0..9]
            @ctx.drawImage(imageObj, x*30, y*15, 30, 15);
      imageObj.src = '/images/green.png';


  exports.game_renderer = new GameRenderer()