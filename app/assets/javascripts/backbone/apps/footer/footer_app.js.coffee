@Excitecode.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->

  @startWithParent = false
  
  API = 
    showFooter: ->
      FooterApp.Show.Controller.showFooter()

  # Show footer on starting FooterApp module
  FooterApp.on "start", ->
    API.showFooter()