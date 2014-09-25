@Excitecode.module "BlogsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listBlogs: ->
      blogs = App.request "blog:entities"
      window.blogs = blogs
      
      @layout = @getLayoutView()

      @layout.on "show", =>
        @showPanel blogs
        @showSidebar blogs

      App.mainRegion.show @layout

    showPanel: (blogs) ->
      panelView = @getPanelView blogs
      @layout.panelRegion.show panelView

    showSidebar: (blogs) ->
      sidebarView = @getSidebarView blogs
      @layout.sidebarRegion.show sidebarView

    getSidebarView: (blogs) ->
      new List.Sidebar
      collection: blogs

    getPanelView: (blogs) ->
      new List.Panel
        collection: blogs

    getLayoutView: ->
      new List.Layout