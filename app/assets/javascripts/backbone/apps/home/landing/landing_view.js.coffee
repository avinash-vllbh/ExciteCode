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

  class Landing.Projects extends App.Views.ItemView
    template: "home/landing/templates/projects"  

  class Landing.About extends App.Views.ItemView
    template: "home/landing/templates/about"  
