@Excitecode.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  # Making marionette remove method as custom _remove method
  _remove = Marionette.View::remove

  _.extend Marionette.View::,

    # Patching Marionette view remove function to display when the view are removed
    # Handle the remove of Marionette there after
    remove: (args...) ->
      # console.log "removing", @
      if @model?.isDestroyed()
        @$el.fadeOut 400, =>
          _remove.apply @, args
      else
        _remove.apply @, args

    templateHelpers: ->

      linkTo: (name, url, options = {}) ->

        _.defaults options,
          external: false

        url = "#" + url unless options.external
        # Escape the name to not to strip any special characters
        "a href = '#{url}'>#{@escape(name)}</a>"
