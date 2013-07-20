namespace 'twoz.screens', (exports, top) ->
  class Menu extends twoz.screens.base
    constructor: ->
      super()

      $('button.start').on 'click', =>
        twoz.screens.game.render()

  exports.menu = new Menu()
