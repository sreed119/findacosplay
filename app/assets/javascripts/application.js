// Sticky footer js
$(window).bind("load", function () {
  var footer = $("#footer");
  var pos = footer.position();
  var height = $(window).height();
  height = height - pos.top;
  height = height - footer.height();
  if (height > 0) {
      footer.css({
          'margin-top': height + 'px'
      });
  }
});

// Flash fade
$(function() {
   $('.alert-box').fadeIn('normal', function() {
      $(this).delay(3700).fadeOut();
   });
});
