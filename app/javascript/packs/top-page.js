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

  // ログイン時のエラーメッセージ
  const loginForm = document.querySelector('#login-form');
  if (loginForm) {
    loginForm.addEventListener('ajax:error', (event) => {
      const [data, status, xhr] = event.detail;
      console.log(data);
      const errorElement = document.querySelector('#login-error-messages');
      if (errorElement) {
        errorElement.innerHTML = '';
        if (data.errors) {
          data.errors.forEach((error) => {
            const errorItem = document.createElement('div');
            errorItem.textContent = error;
            errorElement.appendChild(errorItem);
          });
        }
      }
    });
  }

  // 新規登録時のエラーメッセージ
  const registrationForm = document.querySelector('#registration-form');
  if (registrationForm) {
    registrationForm.addEventListener('ajax:error', (event) => {
      const [data, status, xhr] = event.detail;
      const errorElement = document.querySelector('#registration-error-messages');
      if (errorElement) {
        errorElement.innerHTML = '';
        if (data.errors) {
          data.errors.forEach((error) => {
            const errorItem = document.createElement('div');
            errorItem.textContent = error;
            errorElement.appendChild(errorItem);
          });
        }
      }
    });
  }

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

document.addEventListener('DOMContentLoaded', function() {
    const flashMessages = document.querySelectorAll('.flash');

    flashMessages.forEach(flashMessage => {
      flashMessage.addEventListener('click', () => {
        flashMessage.style.display = 'none';
      });
    });
  });