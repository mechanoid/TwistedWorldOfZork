namespace 'twoz', (exports, top) ->
  class Game
    @config: {}

    @update_screen: (next_screen) ->
      @current_screen?.hide()
      @current_screen = next_screen
      @current_screen.render()


  exports.game = Game
