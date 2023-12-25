document.addEventListener('turbolinks:load', () => {
  // if (location.path != '/relationships') {
  //   return;
  // }
  const followingSection = document.getElementById('following-results-section');
  const followersSection = document.getElementById('followers-results-section');
  const followingButton = document.getElementById('following-results');
  const followersButton = document.getElementById('followers-results');

  followingButton.addEventListener('click', function() {
    followersSection.classList.remove('active');
    followingSection.classList.add('active');

    followingButton.classList.add('active');
    followersButton.classList.remove('active');
  });

  followersButton.addEventListener('click', function() {
    followingSection.classList.remove('active');
    followersSection.classList.add('active');

    followersButton.classList.add('active');
    followingButton.classList.remove('active');
  });
});
