@Excitecode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.Contact extends Entities.Model
    urlRoot: -> Routes.contact_path()
  
  API =    
    newContact: ->
      new Entities.Contact
  
  App.reqres.setHandler "new:contact:entity", ->
    API.newContact()