@Excitecode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.Model extends Backbone.Model

    save: (data, options = {}) ->
      isNew = @isNew()

      _.defaults options,
        wait: true
        success: _.bind(@saveSuccess, @, isNew)

      # Call the save method on parent class i.e., Backbone model
      super data, options

    saveSuccess: (isNew) =>
      console.info "success", @, isNew
      if isNew # Model is being created
        @trigger "created", @
      else # Model is being updated
        @trigger "updated", @
