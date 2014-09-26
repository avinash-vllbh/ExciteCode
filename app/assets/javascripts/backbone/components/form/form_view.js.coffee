@Excitecode.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormWrapper extends App.Views.Layout
    template: "form/templates/form"

    tagName: "form"
    className: "form-horizontal"
    attributes: ->
      "data-type" : "new"
      # "data-type" : @getFormDataType()

    regions:
      formContentRegion: "#form-content-region"

    triggers:
      "submit"                            : "form:submit"
      "click [data-form-button='cancel']" : "form:cancel"

    modelEvents:
      "change:_errors" : "changeErrors"
      "sync:start"     : "syncStart"
      "sync:stop"     : "syncStop"

    serializeData: ->
      buttons: @options.config.buttons

    onShow: ->
      _.defer =>
        @focusFirstInput() if @options.config.focusFirstInput

    focusFirstInput: ->

      # Move th focus to the first input element on page load
      @$(":input:visible:enabled:first").focus()

    getFormDataType: ->
      @model.isNew = -> true
      if @model.isNew() then "new" else "edit"

    changeErrors: (model, errors, options) ->
      if @options.config.errors
        if _.isEmpty(errors) then @removeErrors() else @addErrors errors

    addErrors: (errors = {}) ->
      for name, array of errors
        @addError name, array[0]

    addError: (name, error) ->
      el = @$("[name='#{name}']")
      # Add the error message below the form element
      el.after('<span class="error">'+error+'</span>')

    removeErrors: ->
      @$("span").remove(".error")

    syncStart: (model) ->
      @$el.find("[data-form-button='submit']").prop("disabled",true)
      # Adds opacity class to the form view inside main region
      @$el.addClass("opacity") if @options.config.syncing

    syncStop: (model) ->
      @$el.find("[data-form-button='submit']").prop("disabled",false)

      @$el.removeClass("opacity") if @options.config.syncing
