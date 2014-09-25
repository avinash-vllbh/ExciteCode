@Excitecode = do (Backbone, Marionette) ->
  
  App = new Marionette.Application

  App.rootRoute = "blogs"
  
  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  # Explicitly start footer module and inturn fires module start even
  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()

  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute) if @getCurrentRoute() is ""
      #Backbone.history.navigate "blogs" if Backbone.history.fragment is ""

  App.navigate = (route) ->
    Backbone.history.navigate route

  App.getCurrentRoute = ->
    Backbone.history.fragment
  App
