namespace 'twoz.screens', (exports, top) ->
  class Game extends twoz.screens.base
    constructor: ->
      super()
      twoz.game.run()

  exports.game = new Game()
