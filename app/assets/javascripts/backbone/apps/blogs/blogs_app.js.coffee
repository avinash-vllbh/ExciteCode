@Excitecode.module "BlogsApp", (BlogsApp, App, Backbone, Marionette, $, _) ->

  class BlogsApp.Router extends Marionette.AppRouter
    appRoutes:
      "blogs" : "listBlogs"

  API =
    listBlogs: ->
      console.log "get blogs"

  App.addInitializer ->
    new BlogsApp.Router
      controller: API