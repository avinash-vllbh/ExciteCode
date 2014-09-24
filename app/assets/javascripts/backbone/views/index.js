var BlogView = Backbone.View.extend({
  initialize: function() {
    this.blogs = this.options.blogs;
    this.render();
  },
  render: function() {
    if(this.blogs.length > 0) {
      var out = "<h3><a href = '#new'>Create New</a></h3><ul>";
      _(this.documents).each(function(item) {
          out += "<li><a href='#blog/" + item.id + "'>" + item.escape('title') + "</a></li>";
      });
      out += "</ul>";
      } else {
        out = "<h3>No Blogs! <a href='#new'>Create one</a></h3>";
      }
      $(this.el).html(out);
      $('#app').html(this.el);
    }
});