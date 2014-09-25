@Excitecode.module "BlogsApp", (BlogsApp, App, Backbone, Marionette, $, _) ->

  class BlogsApp.Router extends Marionette.AppRouter
    appRoutes:
      "blog" : "listBlogs"

  API =
    listBlogs: ->
      BlogsApp.List.Controller.listBlogs()

  App.addInitializer ->
    new BlogsApp.Router
      controller: API