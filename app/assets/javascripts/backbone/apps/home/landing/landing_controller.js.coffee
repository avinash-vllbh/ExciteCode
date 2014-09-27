@Excitecode.module "HomeApp.Landing", (Landing, App, Backbone, Marionette, $, _) ->

  class Landing.Controller extends Marionette.Controller

    initialize: ->
      projects = App.request "projects:entities"
      @layout = @getLayoutView()

      # On layout show event, we should show all the three regions in it
      @layout.on "show", =>
        @showIntro()
        @showProjects projects
        @showAbout()

      App.mainRegion.show @layout

    showIntro: ->
      introView = new Landing.Intro
      @layout.introRegion.show introView

    showProjects: (projects)->
      projectsView = @getProjectsList projects
      @layout.projectsRegion.show projectsView

    showAbout: ->
      aboutView = new Landing.About
      @layout.aboutRegion.show aboutView

    aboutRegion: ->
      new Landing.About

    getLayoutView: ->
      new Landing.Layout

    getProjectsList: (projects) ->
      new Landing.Projects
        # collection: new Backbone.Collection(projects.first(3))
        collection: projects