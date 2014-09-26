@Excitecode.module "ContactApp", (ContactApp, App, Backbone, Marionette, $, _) ->
  class ContactApp.Router extends Marionette.AppRouter
    appRoutes:
      "contact" : "contactForm"

  API =
    contactForm: ->
      new ContactApp.New.Controller
      # ContactApp.New.Controller.contactForm()

  App.addInitializer ->
    new ContactApp.Router
      controller: API