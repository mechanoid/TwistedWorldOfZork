// Generated by CoffeeScript 1.6.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  namespace('twoz.screens', function(exports, top) {
    var Menu;
    Menu = (function(_super) {

      __extends(Menu, _super);

      function Menu() {
        var _this = this;
        Menu.__super__.constructor.call(this);
        $('button.start').on('click', function() {
          return twoz.screens.game.render();
        });
      }

      return Menu;

    })(twoz.screens.base);
    return exports.menu = new Menu();
  });

}).call(this);
