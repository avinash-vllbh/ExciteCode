do (Marionette) ->
# Overwriting default render method of Marionette
  _.extend Marionette.Renderer,
    
    lookups: ["backbone/apps/", "backbone/components/"]

    render: (template, data) ->
    # Default path for all templates to look for
      path = @getTemplate(template)
      unless path
        throw "Template #{template} is not found"
      path(data)

    getTemplate: (template) ->
      for lookup in @lookups
        return JST[lookup + template] if JST[lookup + template]