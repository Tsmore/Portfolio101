document.addEventListener('DOMContentLoaded', function() {
  const flashMessages = document.querySelectorAll('.flash');

  flashMessages.forEach(function(flashMessage) {
    setTimeout(function() {
      flashMessage.style.display = 'none';
    }, 5000);
  });
});
