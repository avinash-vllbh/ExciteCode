@Excitecode.module "BlogsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "blogs/list/templates/list_layout"
    className: "container blog-section"

    regions:
      panelRegion: "#panel-region"
      sidebarRegion: "#sidebar-region"

  class List.Empty extends App.Views.ItemView
    template: "blogs/list/templates/_empty"

  class List.Blog extends App.Views.ItemView
    template: "blogs/list/templates/_blog"
    tagName: 'div'
    className: 'blog-post-section row'

  class List.Panel extends App.Views.CompositeView
    template: "blogs/list/templates/_panel"
    childView: List.Blog
    childViewContainer: "#blogs-collection"

  class List.Sidebar extends App.Views.ItemView
    template: "blogs/list/templates/_sidebar"
    
    # To update the sidebar section in model's are changed
    collectionEvents:
      "reset" : "render"