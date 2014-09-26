@Excitecode.module "ContactApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends Marionette.Controller

    initialize: ->
      window.c = @
      contact = App.request "new:contact:entity"

      @listenTo contact, "created", ->
        App.vent.trigger "contact:created", contact

      @layout = @getLayoutView()

      @layout.on "destroy", ->
        console.log "closing view"

      @layout.on "show", =>
        @formRegion(contact)

      App.mainRegion.show @layout

      onDestroy: ->
        console.log "controller closing"

    formRegion: (contact) ->
      contactView = @getContactView(contact)

      # Listen to form cancel event nd trgger cancelled action in API;
      @listenTo contactView, "form:cancel", ->
        App.vent.trigger "contact:cancelled"

      formView = App.request "form:wrapper", contactView   
      @layout.formRegion.show formView

    getLayoutView: ->
      new New.Layout

    getContactView: (contact) ->
      new New.Contact
        model: contact
