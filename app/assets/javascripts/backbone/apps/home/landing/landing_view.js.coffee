@Excitecode.module "HomeApp.Landing", (Landing, App, Backbone, Marionette, $, _) ->
  
  class Landing.Layout extends App.Views.Layout
    template: "home/landing/templates/landing_layout"  
    tagName: "div"
    className: "main-wrapper"

    regions:
      introRegion:    "#intro-region"
      projectsRegion: "#projects-region"
      aboutRegion:    "#about-region"

  class Landing.Intro extends App.Views.ItemView
    template: "home/landing/templates/intro"
    className: "intro-body"

  class Landing.Project extends App.Views.ItemView
    template: "home/landing/templates/_project"
    className: "project-container col-md-3 col-md-offset-1"

  class Landing.Projects extends App.Views.CompositeView
    template: "home/landing/templates/projects"

    childView: Landing.Project
    childViewContainer: ".projects-container"

  class Landing.About extends App.Views.ItemView
    template: "home/landing/templates/about"  
