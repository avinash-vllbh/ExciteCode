@Excitecode.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends Marionette.Controller
    initialize: (options = {}) ->
      @contentView = options.view
      window.contentView = @contentView

      @formLayout = @getFormLayout options.config

      @listenTo @formLayout, "show", @formContentRegion
      @listenTo @formLayout, "destroy", @destroy
      @listenTo @formLayout, "form:submit", @formSubmit
      @listenTo @formLayout, "form:cancel", @formCancel

    formCancel: ->
      @contentView.triggerMethod "form:cancel"
      
    onDestroy: ->
      console.log "onClose"

    formSubmit: ->
      data = Backbone.Syphon.serialize @formLayout
      model = @contentView.model
      @processFormSubmit data, model

    processFormSubmit: (data, model) ->
      model.save data

    formContentRegion: ->
      @formLayout.formContentRegion.show @contentView

    getFormLayout: (options = {}) ->
      config = @getDefaultConfig _.result(@contentView, "form")

      new Form.FormWrapper
        config: config
        model: @contentView.model

    getDefaultConfig: (config = {}) ->
      _.defaults config,
        footer: true
        focusFirstInput: true
        errors: true
        syncing: true
        buttons: @getDefaultButtons config.buttons

    getDefaultButtons: (buttons = {}) ->
      _.defaults buttons,
        primary: "Save"
        cancel: "Cancel"

  App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
    # throw new Error "No model found inside of forn's contentView" unless contentView.model
    formController = new Form.Controller
      view: contentView
      config: options
    formController.formLayout