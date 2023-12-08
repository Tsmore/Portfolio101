document.addEventListener('turbolinks:load', () => {

  let nav = document.querySelector("#nav-section");
  let btn = document.querySelector(".toggle-btn");

  btn.onclick = () => {
    nav.classList.toggle("open");
  };

});
