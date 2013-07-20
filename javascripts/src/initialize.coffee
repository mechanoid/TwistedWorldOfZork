# TODO: move to separate library
Modernizr.addTest "standalone", ->
  window.navigator.standalone != false

# From https://github.com/jashkenas/coffee-script/wiki/FAQ
#
# Usage:
#
# namespace 'Hello.World', (exports) ->
#   # `exports` is where you attach namespace members
#   exports.hi = -> console.log 'Hi World!'
#
# namespace 'Say.Hello', (exports, top) ->
#   # `top` is a reference to the main namespace
#   exports.fn = -> top.Hello.World.hi()
#
# Say.Hello.fn()  # prints 'Hi World!'
@namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top



Modernizr.load [
  {
    load: [
      "javascripts/vendor/jquery-2.0.3.js"
    ]

    complete: ->
      console.info "Vendor libraries loaded ..."
  }

  {
    load: [
      "javascripts/lib/dom_extensions.js"
      "javascripts/lib/game.js"
      "javascripts/lib/screen.base.js"
      "javascripts/lib/screen.menu.js"
    ]

    complete: ->
      console.info "Base libraries loaded ..."
  }

  {
    test: Modernizr.standalone
    yep: "javascripts/lib/screen.splash.js"
    nope: "javascripts/lib/screen.install.js"
    complete: ->
      console.info "initial screen js loaded ..."
      new twoz.screens.current.render()
      null
  }
]

if Modernizr.standalone
  Modernizr.load [
    load: [
    ]
  ]
