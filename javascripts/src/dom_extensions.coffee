HTMLElement.prototype.hasClass = (name) ->
  new RegExp("(^|\\s)#{name}(\\s|$)").test(@className)

HTMLElement.prototype.addClass = (name) ->
  @className += " #{name}" unless @hasClass(name)

HTMLElement.prototype.removeClass = (name) ->
  @className = @className.replace(new RegExp(" ?#{name}"), '')

Array.prototype.addClass = (name) ->
  entry.addClass(name) for entry in @

Array.prototype.removeClass = (name) ->
  entry.removeClass(name) for entry in @
