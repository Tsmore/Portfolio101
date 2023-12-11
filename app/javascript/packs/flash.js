document.addEventListener('turbolinks:load', function() {
  const flashMessages = document.querySelectorAll('.flash');

  flashMessages.forEach(function(flashMessage) {
    setTimeout(function() {
      flashMessage.style.display = 'none';
    }, 5000); // 5秒後に非表示
  });
});
