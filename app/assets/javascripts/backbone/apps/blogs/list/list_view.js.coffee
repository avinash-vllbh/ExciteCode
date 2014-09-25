@Excitecode.module "BlogsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "blogs/list/templates/list_layout"
