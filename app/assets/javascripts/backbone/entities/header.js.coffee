@Excitecode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.Header extends Entities.Model
  
  class Entities.HeaderCollection extends Entities.Collection
    model: Entities.Header
  
  API =
    getHeaders: ->
      new Entities.HeaderCollection [
        { name: "Projects", url: Routes.projects_path() }
        { name: "About", url: Routes.blog_index_path() }
        { name: "Blog", url: Routes.blog_index_path() }
        { name: "Contact", url: Routes.contact_path() }
      ]
  
  App.reqres.setHandler "header:entities", ->
    API.getHeaders()