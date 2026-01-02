//= require jquery
//= require jquery_ujs
//= require materialize

// Toggle menu function (global scope for onclick handler)
function toggleMenu() {
   var x = document.getElementById("hamburger-content");
   if (x.style.display === "block") {
      x.style.display = "none";
   } else {
      x.style.display = "block";
   }
}

$("#hamburger-toggle").on("click", function(event){
   toggleMenu();
});


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
