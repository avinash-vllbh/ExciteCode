var BlogView = Backbone.View.extend({
  tagName: 'div',
  blogsTpl: _.template( $('#blogs-template').html() ),

  // Called when the view is first created
  initialize: function() {
    this.$el = $('.blogs');
  },

  // Re-render the titles of the todo item.
  render: function() {
    this.$el.html( this.blogsTpl( this.model.attributes ) );
    this.input = this.$('.edit');
    return this;
  },

  edit: function() {
    // executed when todo label is double clicked
  },

  close: function() {
    // executed when todo loses focus
  },

  updateOnEnter: function( e ) {
    // executed on each keypress when in todo edit mode,
    // but we'll wait for enter to get in action
  }
});