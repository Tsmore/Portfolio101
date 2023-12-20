document.addEventListener('turbolinks:load', () => {
  const usersResultsSection = document.getElementById('users-results-section');
  const postsResultsSection = document.getElementById('posts-results-section');
  const showUsersButton = document.getElementById('show-users-results');
  const showPostsButton = document.getElementById('show-posts-results');

  if (usersResultsSection && postsResultsSection) {
    if (usersResultsSection.children.length > 0 && postsResultsSection.children.length === 0) {
      usersResultsSection.classList.add('active');
      usersResultsSection.style.display = 'block';
    } else if (postsResultsSection.children.length > 0) {
      postsResultsSection.classList.add('active');
      postsResultsSection.style.display = 'block';
    }
  }

  showUsersButton?.addEventListener('click', function() {
    usersResultsSection.classList.add('active');
    usersResultsSection.style.display = 'block';
    postsResultsSection.classList.remove('active');
    postsResultsSection.style.display = 'none';
    showUsersButton.classList.add('active');
    showPostsButton.classList.remove('active');
  });

  showPostsButton?.addEventListener('click', function() {
    postsResultsSection.classList.add('active');
    postsResultsSection.style.display = 'block';
    usersResultsSection.classList.remove('active');
    usersResultsSection.style.display = 'none';
    showPostsButton.classList.add('active');
    showUsersButton.classList.remove('active');
  });
});
