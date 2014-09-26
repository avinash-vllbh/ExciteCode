@Excitecode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.Model extends Backbone.Model

    # Do not update the model or model from collection until the server sends a response "ok"
    save: (data, options = {}) ->
      isNew = @isNew()

      _.defaults options,
        wait: true
        success:  _.bind(@saveSuccess, @, isNew)
        error:    _.bind(@saveError, @)

      @unset "_errors" # Unset any arrays that might be set before calling save on model
      # Call the save method on parent class i.e., Backbone model
      super data, options

    saveSuccess: (isNew) =>
      console.info "success", @, isNew
      if isNew # Model is being created
        @trigger "created", @
      else # Model is being updated
        @trigger "updated", @

    saveError: (model, xhr, options) =>
      # Look for form errors only when response is not 500 or 404
      # Covert response to valid JS object, access errors property on it
      # Set it to _errors attribute on the model
      @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404

    # check if a model is destroyed
    isDestroyed: ->
      @get "_destroy"

    # Do not delete the model or model from collection until the server sends a response "ok"
    destroy: (options = {}) ->
      _.defaults options,
        wait: true

      @set _destroy: true # Setting destroy attribute to true indicating success
      super options

