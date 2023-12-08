document.addEventListener('turbolinks:load', () => {

  let nav = document.querySelector("#nav-section");
  let btn = document.querySelector(".toggle-btn");
  let mask = document.querySelector("#mask");

  btn.onclick = () => {
    nav.classList.toggle("open");
  };

  mask.onclick = () => {
    nav.classList.toggle("open");
  };

});
