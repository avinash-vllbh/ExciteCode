@Excitecode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Projects extends Entities.Model

  class Entities.ProjectsCollection extends Entities.Collection
    model: Entities.Projects
    url: -> Routes.projects_path()

  API =
    getProjectsEntities: ->
      projects = new Entities.ProjectsCollection
      projects.fetch()
      projects

  App.reqres.setHandler "projects:entities", ->
    API.getProjectsEntities()