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

function initializeHomeBannerCarousel() {
   const carousel = document.querySelector('.home_banner_carousel');
   if (!carousel) return;

   const slides = Array.from(carousel.querySelectorAll('.home_banner_slide'));
   const prevButton = carousel.querySelector('.home_banner_prev');
   const nextButton = carousel.querySelector('.home_banner_next');
   const dots = Array.from(carousel.querySelectorAll('.home_banner_dot'));

   if (!slides.length) return;

   let currentIndex = 0;
   let autoRotate;

   const updateDots = () => {
      dots.forEach((dot, index) => {
         dot.classList.toggle('is-active', index === currentIndex);
      });
   };

   const showSlide = (index) => {
      currentIndex = (index + slides.length) % slides.length;
      slides.forEach((slide, slideIndex) => {
         slide.classList.toggle('is-active', slideIndex === currentIndex);
      });
      updateDots();
   };

   const startAutoRotate = () => {
      clearInterval(autoRotate);
      autoRotate = setInterval(() => showSlide(currentIndex + 1), 4000);
   };

   prevButton?.addEventListener('click', () => {
      showSlide(currentIndex - 1);
      startAutoRotate();
   });

   nextButton?.addEventListener('click', () => {
      showSlide(currentIndex + 1);
      startAutoRotate();
   });

   dots.forEach((dot) => {
      dot.addEventListener('click', () => {
         showSlide(Number(dot.dataset.slide));
         startAutoRotate();
      });
   });

   showSlide(0);
   startAutoRotate();
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

    initializeHomeBannerCarousel();

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