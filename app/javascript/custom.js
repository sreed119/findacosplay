window.addEventListener('load', function() {

    window.toggleMenu = function() {
       var x = document.getElementById("hamburger-content");
       if (x && x.style.display === "block") {
          x.style.display = "none";
       } else if (x) {
          x.style.display = "block";
       }
    }

    window.toggleDropdown = function() {
       var y = document.getElementById("dropdown_content");
       var trigger = document.getElementById("dropdown_trigger");
       if (y && y.style.display === "block") {
          trigger.style.backgroundColor = "#8ac5f2";
          y.style.display = "none";
       } else if (y) {
          y.style.display = "block";
          trigger.style.backgroundColor = "#7DB1DA";
       }
    }

    // Flash fade
    document.querySelectorAll('.alert-box').forEach((el) => {
       el.style.display = 'block';
       setTimeout(() => { el.style.display = 'none'; }, 2000);
    });
    
    // Click handlers
    const hamburgerToggle = document.getElementById("hamburger-toggle");
    if (hamburgerToggle) {
       hamburgerToggle.addEventListener("click", window.toggleMenu);
    }

    const dropdownTrigger = document.getElementById("dropdown_trigger");
    if (dropdownTrigger) {
       dropdownTrigger.addEventListener("click", window.toggleDropdown);
    }

    // TomSelect
    if (typeof TomSelect !== 'undefined') {
       document.querySelectorAll('.responsive_search').forEach((el)=>{
          let settings = {
             create: true,
             sortField: {
                field: "text",
                direction: "asc"
             }
          };
          new TomSelect(el, settings);
       });
    }
});