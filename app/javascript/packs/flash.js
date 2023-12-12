document.addEventListener('turbolinks:load', function() {
  const flashMessages = document.querySelectorAll('.flash');

  flashMessages.forEach(function(flashMessage) {
    setTimeout(function() {
      flashMessage.classList.add('flash-hide');
    }, 3000);
  });
});
