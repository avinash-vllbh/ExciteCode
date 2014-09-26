@Excitecode.module "ContactApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends Marionette.Controller

    initialize: ->
      contact = App.request "new:contact:entity"

      @listenTo contact, "created", ->
        App.vent.trigger "contact:created", contact

      @layout = @getLayoutView()

      @layout.on "show", =>
        @formRegion(contact)

      App.mainRegion.show @layout

    formRegion: (contact) ->
      contactView = @getContactView(contact)
      formView = App.request "form:wrapper", contactView   
      @layout.formRegion.show formView

    getLayoutView: ->
      new New.Layout

    getContactView: (contact) ->
      new New.Contact
        model: contact
