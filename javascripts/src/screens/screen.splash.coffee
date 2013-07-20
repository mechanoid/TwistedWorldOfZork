namespace 'twoz.screens', (exports, top) ->
  class Splash extends twoz.screens.base
    constructor: ->
      super()

      $('.screen.splash').on 'click', ->
        twoz.screens.menu.render()


  exports.splash = new Splash()
  exports.current = exports.splash
