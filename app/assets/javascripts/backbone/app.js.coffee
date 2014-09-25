@Excitecode = do (Backbone, Marionette) ->
  
  App = new Marionette.Application

  # App.rootRoute = Routes.blog_index_path()
  
  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  # Explicitly start footer module and inturn fires module start even
  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()

  App.on "start", ->
    if Backbone.history
      Backbone.history.start()
      # @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App
