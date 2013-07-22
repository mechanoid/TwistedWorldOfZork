// Generated by CoffeeScript 1.6.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  namespace('twoz.screens', function(exports, top) {
    var Splash;
    Splash = (function(_super) {

      __extends(Splash, _super);

      function Splash() {
        Splash.__super__.constructor.call(this);
        $('.screen.splash').on('click', function() {
          return twoz.screens.menu.render();
        });
      }

      return Splash;

    })(twoz.screens.base);
    exports.splash = new Splash();
    return exports.current = exports.splash;
  });

}).call(this);
