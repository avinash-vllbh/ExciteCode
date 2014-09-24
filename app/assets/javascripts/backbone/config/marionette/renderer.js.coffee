# Overwriting default render method of Marionette
Backbone.Marionette.Renderer.render = (template, data) ->
  # Default path for all templates to look for
  path = JST["backbone/apps/" + template]
  unless path
    throw "Template #{template} is not found"
  path(data)