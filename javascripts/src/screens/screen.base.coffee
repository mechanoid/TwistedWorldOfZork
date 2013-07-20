namespace 'twoz.screens', (exports, top) ->
  class Base
    name: =>
      @constructor.name.toLowerCase()

    render: =>
      $('.screen').removeClass('current')
      $(".screen.#{@name()}").addClass('current')

  exports.base = Base