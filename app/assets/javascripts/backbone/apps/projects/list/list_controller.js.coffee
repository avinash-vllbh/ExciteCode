@Excitecode.module "ProjectsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends Marionette.Controller
    initialize: ->
      projects = App.request "projects:entities"
      @layout = @getLayoutView()
      @layout.on "show", =>
        @showProjects projects
        @showSideBar projects

      App.mainRegion.show @layout

    showProjects: (projects) ->
      panelView = @getProjectsView projects
      @layout.panelRegion.show panelView

    getProjectsView: (projects) ->
      new List.Panel
        collection: projects

    getLayoutView: ->
      new List.Layout

    showSideBar: (projects) ->
      sidebarView = @getSideBbarView projects
      @layout.sidebarRegion.show sidebarView

    getSideBbarView: (projects) ->
      new List.Sidebar
        collection: projects