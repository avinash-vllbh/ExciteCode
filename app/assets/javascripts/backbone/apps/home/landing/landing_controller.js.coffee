@Excitecode.module "HomeApp.Landing", (Landing, App, Backbone, Marionette, $, _) ->

  class Landing.Controller extends Marionette.Controller

    initialize: ->
      @layout = @getLayoutView()

      # On layout show event, we should show all the three regions in it
      @layout.on "show", =>
        @showIntro()
        @showProjects()
        @showAbout()

      App.mainRegion.show @layout

    showIntro: ->
      introView = new Landing.Intro
      @layout.introRegion.show introView

    showProjects: ->
      projectsView = @getProjectsList()
      @layout.projectsRegion.show projectsView

    showAbout: ->
      aboutView = new Landing.About
      @layout.aboutRegion.show aboutView

    aboutRegion: ->
      new Landing.About

    getLayoutView: ->
      new Landing.Layout

    getProjectsList: ->
      projects = App.request "projects:entities"
      new Landing.Projects
        collection: projects