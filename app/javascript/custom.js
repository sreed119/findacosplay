import "tom-select"

function toggleMenu() {
   const x = document.getElementById("hamburger-content");
   if (!x) return;
   x.style.display = (x.style.display === "block") ? "none" : "block";
}

function toggleDropdown() {
   const y = document.getElementById("dropdown_content");
   const trigger = document.getElementById("dropdown_trigger");
   if (!y || !trigger) return;
   const isOpen = y.style.display === "block";
   trigger.style.backgroundColor = isOpen ? "#8ac5f2" : "#7DB1DA";
   y.style.display = isOpen ? "none" : "block";
}

function initializeCustom() {

    document.querySelectorAll('.alert-box').forEach((el) => {
       el.style.display = 'block';
       setTimeout(() => { el.style.display = 'none'; }, 2000);
    });
    
    document.querySelectorAll('.responsive_search').forEach((el)=>{
       if (el.tomselect) return; // already initialized
       const settings = {
          create: true,
          sortField: {
             field: "text",
             direction: "asc"
          }
       };
       new TomSelect(el, settings);
    });

    const hamburgerToggle = document.getElementById("hamburger-toggle");
    if (hamburgerToggle) {
       hamburgerToggle.addEventListener("click", toggleMenu);
    }

    const dropdownTrigger = document.getElementById("dropdown_trigger");
    if (dropdownTrigger) {
       dropdownTrigger.addEventListener("click", toggleDropdown);
    }
}

document.addEventListener('turbo:load', initializeCustom);
document.addEventListener('DOMContentLoaded', initializeCustom);