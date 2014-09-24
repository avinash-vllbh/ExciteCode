// --------------Blogs Model-----------------------
var Blog = Backbone.Model.extend({
  url : function() {
      var base = 'blog';
      if (this.isNew()) return base;
      return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
    }
});


// // --------------Blogs collection-----------------------
// var Blogs = Backbone.Collection.extend({
//   model : blog
// });
