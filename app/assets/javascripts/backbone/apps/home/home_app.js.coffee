@Excitecode.module "HomeApp", (HomeApp, App, Backbone, Marionette, $, _) ->
  
  class HomeApp.Router extends Marionette.AppRouter
    appRoutes:
      "" : "home"

  API =
    home: ->
      new HomeApp.Landing.Controller

  # App.vent.on "contact:cancelled contact:created", ->
  #   App.navigate Routes.blog_index_path(), trigger: true

  App.addInitializer ->
    new HomeApp.Router
      controller: API