// Generated by CoffeeScript 1.6.1
(function() {

  namespace('twoz', function(exports, top) {
    var Game,
      _this = this;
    Game = (function() {

      function Game() {
        var _this = this;
        this.handle_map_update = function(event) {
          return Game.prototype.handle_map_update.apply(_this, arguments);
        };
      }

      Game.config = {
        map_settings: {}
      };

      Game.prototype.handle_map_update = function(event) {
        return console.debug(event.data);
      };

      Game.prototype.run = function() {
        var worker;
        worker = new Worker('javascripts/lib/worker/worker.map.js');
        worker.onmessage = this.handle_map_update;
        return worker.postMessage("Can you hear me?");
      };

      return Game;

    })();
    return exports.game = new Game();
  });

}).call(this);
