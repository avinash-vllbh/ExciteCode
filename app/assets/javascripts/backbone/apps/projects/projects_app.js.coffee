@Excitecode.module "ProjectsApp", (ProjectsApp, App, Backbone, Marionette, $, _) ->
  
  class ProjectsApp.Router extends Marionette.AppRouter
    appRoutes:
      "projects" : "listProjects"

  API =
    listProjects: ->
      new ProjectsApp.List.Controller

  # App.vent.on "contact:cancelled contact:created", ->
  #   App.navigate Routes.blog_index_path(), trigger: true

  App.addInitializer ->
    new ProjectsApp.Router
      controller: API