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
      "submit" : "form:submit"

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