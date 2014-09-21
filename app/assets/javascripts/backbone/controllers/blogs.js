App.Controllers.Blogs = Backbone.Controller.extend({
    routes: {
        "blog/:id":            "edit",
        "":                    "index",
        "new":                 "newBlog"
    },
    
    edit: function(id) {
        var blog = new Blog({ id: id });
        blog.fetch({
            success: function(model, resp) {
                new App.Views.Edit({ model: blog });
            },
            error: function() {
                new Error({ message: 'Could not find that document.' });
                window.location.hash = '#';
            }
        });
    },
    
    index: function() {
        $.getJSON('/blog', function(data) {
            if(data) {
                var blogs = _(data).map(function(i) { return new Blog(i); });
                new App.Views.Index({ blogs: blogs });
            } else {
                new Error({ message: "Error loading blogs." });
            }
        });
    },
    
    newBlog: function() {
        new App.Views.Edit({ model: new Blog() });
    }
});