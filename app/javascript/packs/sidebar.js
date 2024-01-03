document.addEventListener('turbolinks:load', () => {

  const sidebar = document.querySelector('.sidebar');

  // クリックで展開
  // aタグは処理をキャンセル
  // sidebar.addEventListener('click', function(event) {
  //   if (event.target.tagName === 'A' ) {
  //     return;
  //   }
  //   if (!sidebar.classList.contains('active')) {
  //     sidebar.classList.add('active');
  //   }
  //   event.stopPropagation();
  // });

  // document.addEventListener('click', function(event) {
  //   if (!sidebar.contains(event.target)) {
  //     sidebar.classList.remove('active');
  //   }
  // });

  // ホバーで展開
  sidebar.addEventListener('mouseenter', function(event) {
    sidebar.classList.add('active');
  });

  sidebar.addEventListener('mouseleave', function(event) {
    sidebar.classList.remove('active');
  });
});