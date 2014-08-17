// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require highlight.pack
//= require_tree .


// $(document).ready(function() {
//   var header_height = $("#site-header").height();
//   var padding_for_header = header_height + "px";
//   $("#main-container").css({'padding-top': padding_for_header});
//   console.log("Resetting padding!!!!");
// });

// ADD SLIDEDOWN ANIMATION TO DROPDOWN //
$(document).ready(function() {
  var screen_width = $( window ).width();
  $(window).resize(function() {
    screen_width = $( window ).width();
  });
  $('#site-header ul.nav li.dropdown').hover(function() {
      if(screen_width > 768) {
        $(this).find('.dropdown-menu').stop(true, true).delay(80).slideDown();
      }
    }, function() {
      if(screen_width > 768) {
        $(this).find('.dropdown-menu').stop(true, true).delay(80).slideUp();
      }
    }
  );
});

$(document).ready(function() {
  $("div.color").mouseenter(function() {
    var id = $(this).attr('id').slice(-1);
    console.log(id);
    $("#paletteInfo"+id).show("slow").css("display", "inline-block");
    $("#palette"+id).hide("slow");
    // $("#palette"+id).css("display", "none");
    // $("#paletteInfo"+id).css("display", "inline-block");
  });
});

$(document).ready(function() {
  $("div.colorInfo").mouseleave(function() {
    var id = $(this).attr('id').slice(-1);
    $("#palette"+id).show("slow").css("display", "inline-block");
    $("#paletteInfo"+id).hide("slow");
    // $("#paletteInfo"+id).css("display", "none");
    // $("#palette"+id).css("display", "inline-block");
  });
});

hljs.initHighlightingOnLoad();

