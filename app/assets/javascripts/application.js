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

function toggleDropdown() {
   var y = document.getElementById("dropdown_content");
   var trigger = document.getElementById("dropdown_trigger");
   if (y.style.display === "block") {
      trigger.style.backgroundColor = "#8ac5f2";
      y.style.display = "none";
   } else {
      y.style.display = "block";
      trigger.style.backgroundColor = "#7DB1DA";
   }
}

$(document).ready(function(){
    // Flash fade
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

    $("#hamburger-toggle").on("click", function(event){
      toggleMenu();
   });

   $("#dropdown_trigger").on("click", function(event){
      toggleDropdown();
   });
});
