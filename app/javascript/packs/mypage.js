document.addEventListener('turbolinks:load', () => {
  // if (!location.pathname.match('/\/users\/\d+/')) {
  //   return;
  // }
  const mypageSection = document.getElementById('mypage-section');
  const postsSection = document.getElementById('posts-section');
  const mypageButton = document.getElementById('show-mypage');
  const postsButton = document.getElementById('show-posts');

  mypageButton.addEventListener('click', function() {
    postsSection.classList.remove('active');
    postsSection.style.display = 'none';

    mypageSection.style.display = 'block';
    setTimeout(() => {
      mypageSection.classList.add('active');
    }, 100);

    mypageButton.classList.add('active');
    postsButton.classList.remove('active');
  });

  postsButton.addEventListener('click', function() {
    mypageSection.classList.remove('active');
    mypageSection.style.display = 'none';

    postsSection.style.display = 'block';
    setTimeout(() => {
      postsSection.classList.add('active');
    }, 100);

    postsButton.classList.add('active');
    mypageButton.classList.remove('active');
  });
});
