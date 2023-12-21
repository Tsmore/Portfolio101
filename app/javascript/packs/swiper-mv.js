document.addEventListener('turbolinks:load', () => {
  const swiper = new Swiper('.swiper-mv', {
    loop: true,
    effect: "fade", //切り替え方法をfadeに変更
    fadeEffect: {
      crossFade: true
    },
    autoplay: {
      delay: 5000, // 3秒間表示
      disableOnInteraction: false,
    },
    speed: 3000, //3秒間で切り替え
  });
});