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

  const wrapper = document.querySelector('.wrapper');
  const loginLink = document.querySelector('.login-link');
  const registerLink = document.querySelector('.register-link');
  const btnPopup = document.querySelector('.login-popup-btn');
  const iconClose = document.querySelector('.icon-close');

  registerLink.addEventListener('click', () => {
    wrapper.classList.add('active');
  });

  loginLink.addEventListener('click', () => {
    wrapper.classList.remove('active');
  });

  btnPopup.addEventListener('click', () => {
    wrapper.classList.add('active-popup');
  });

  iconClose.addEventListener('click', () => {
    wrapper.classList.remove('active-popup');
  });

});
