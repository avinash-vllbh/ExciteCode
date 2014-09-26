do (Backbone) ->
  _sync = Backbone.sync
  Backbone.sync = (method, entity, options = {}) ->

    _.defaults options,
      # binding jQuery before send and complete methods to prevent form double save's
      beforeSend: _.bind(methods.beforeSend, entity)
      complete: _.bind(methods.complete, entity)

    sync = _sync(method, entity, options)
    if !entity._fetch and method is "read"
      entity._fetch = sync

  methods =
    beforeSend: ->
      # console.log "sync started"
      @trigger "sync:start", @

    complete: ->
      # console.log "sync stopped"
      @trigger "sync:stop", @