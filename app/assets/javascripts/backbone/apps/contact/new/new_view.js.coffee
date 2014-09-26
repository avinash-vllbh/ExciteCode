@Excitecode.module "ContactApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.Layout
    template: "contact/new/templates/contact_layout"

    regions:
      formRegion: "#form-region"

  class New.Contact extends App.Views.ItemView
    template: "contact/new/templates/contact_form"
  