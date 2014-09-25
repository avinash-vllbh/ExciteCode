@Excitecode.module "BlogsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listBlogs: ->
      blogs = App.request "blog:entities"
      
      window.blogs = blogs
      
      @layout = @getLayoutView()

      App.mainRegion.show @layout

    getLayoutView: ->
      new List.Layout