namespace 'twoz', (exports, top) ->
  class GameRenderer
    settings:
      canvas:
        size: 540

    constructor: ->
      @initialize_canvas()

    field_name: (field) ->
      type = switch field
        when "." then "field"
        when "F" then "field"
        when "T" then "tree"
        when "R" then "rock"
      type

    initialize_canvas: ->
      canvas = $('<canvas></canvas>')
      $('.screen.game').html(canvas)

      canvas.width = @settings.canvas.size * 2
      canvas.height = @settings.canvas.size * 2

      @canvas = $('.screen.game canvas')[0]

      @canvas.style.width = "#{@settings.canvas.size}px"
      @canvas.style.height = "#{@settings.canvas.size}px"
      @ctx = @canvas.getContext("2d")

    # position key is delivered as x\dy\d e.g. x0y1
    # so we have to split it and return the splitted values
#    tile_position: (position_key) ->
#      position_key[1..-1].split('y')


    current_position_key: ->
      "x#{@current_position.x}y#{@current_position.y}"

    current_tile: ->
      @tiles[@current_position_key()]

    draw_field: (field, x, y) ->
      image_path = "images/#{@field_name(field)}.png"
      @ctx.drawImage(twoz.images[image_path], x*30, y*15, 30, 15);

    draw_row: (row, y_index) ->
      @draw_field(field, x_index, y_index) for field, x_index in row.split('')


    paint_map: (@tiles, @current_position) ->
      console.debug 'paint map'
#      console.debug tiles
#      console.debug current_position
      @ctx.save()
      tile = @current_tile()

      @draw_row(row,y_index) for row, y_index in tile


  exports.game_renderer = new GameRenderer()