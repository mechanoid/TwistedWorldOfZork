# TODO: move to separate library
Modernizr.addTest "standalone", ->
  window.navigator.standalone != false


Modernizr.load [
  {
    load: [
      "javascripts/vendor/sizzle.js"
    ]

    complete: ->
      console.info "Vendor libraries loaded ..."
  }

  {
    load: [
      "javascripts/lib/game.js"
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
  }
]
