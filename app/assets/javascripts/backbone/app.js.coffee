@Excitecode = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
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

  App