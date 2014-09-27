@Excitecode.module "ProjectsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template          : "blogs/list/templates/list_layout"
    className         : "container projects-container"

    regions:
      panelRegion     : "#panel-region"
      sidebarRegion   : "#sidebar-region"

  class List.Empty extends App.Views.ItemView
    template          : "projects/list/templates/_empty"

  class List.Project extends App.Views.ItemView
    template          : "projects/list/templates/_project"
    tagName           : "div"
    className         : "project-container col-md-4 col-md-offset-1"

  class List.Panel extends App.Views.CompositeView
    template          : "projects/list/templates/_panel"
    childView         : List.Project
    childViewContainer: ".projects-container"

  class List.Sidebar extends App.Views.ItemView
    template: "projects/list/templates/_sidebar"