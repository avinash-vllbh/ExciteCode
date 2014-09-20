$(document).ready(function(){

  // --------------Model for Blog------------------------
  Blog = Backbone.Model.extend({});
  var blog = new Blog();
  blog.url = '/blog/testing-custom-routes-prefixes2.json';
  blog.fetch({
    success : function(){
      console.log(blog);
    }
  });

  // --------------Blogs collections-----------------------
  var Blogs = Backbone.Collection.extend({});
  var blogs = new Blogs();
  blogs.url = '/blog/index.json';
  blogs.fetch({
    success: function(){
      console.log(blogs);
    }
  });

});