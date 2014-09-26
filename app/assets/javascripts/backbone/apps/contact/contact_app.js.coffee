@Excitecode.module "ContactApp", (ContactApp, App, Backbone, Marionette, $, _) ->
  class ContactApp.Router extends Marionette.AppRouter
    appRoutes:
      "contact" : "contactForm"

  API =
    contactForm: ->
      new ContactApp.New.Controller
      # ContactApp.New.Controller.contactForm()

  App.vent.on "contact:cancelled contact:created", ->
    App.navigate Routes.blog_index_path(), trigger: true

  App.addInitializer ->
    new ContactApp.Router
      controller: API