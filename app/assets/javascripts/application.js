//= require jquery
//= require jquery_ujs
//= require materialize

// Flash fade
$(function() {
   $('.alert-box').fadeIn('normal', function() {
      $(this).delay(2000).fadeOut();
   });
});
