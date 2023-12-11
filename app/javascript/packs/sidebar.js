document.addEventListener('turbolinks:load', () => {

  const sidebar = document.querySelector('.sidebar');

  sidebar.addEventListener('click', function(event) {
    if (!sidebar.classList.contains('active')) {
      sidebar.classList.add('active');
    }
    event.stopPropagation();
  });

  document.addEventListener('click', function(event) {
    if (!sidebar.contains(event.target)) {
      sidebar.classList.remove('active');
    }
  });
});