@Excitecode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Blog extends Entities.Model

  class Entities.BlogsCollection extends Entities.Collection
    model: Entities.Blog
    url: -> Routes.blog_index_path()

  API =
    getBlogEntities: ->
      blogs = new Entities.BlogsCollection
      blogs.fetch()
      blogs

  App.reqres.setHandler "blog:entities", ->
    API.getBlogEntities()