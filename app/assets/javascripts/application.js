//= require jquery
//= require jquery_ujs
//= require materialize

// Flash fade
$(function() {
   $('.alert-box').fadeIn('normal', function() {
      $(this).delay(2000).fadeOut();
   });
   
   document.querySelectorAll('.responsive_search').forEach((el)=>{
      let settings = {
         create: true,
         sortField: {
            field: "text",
            direction: "asc"
         }
      };
      new TomSelect(el,settings);
   });


});
