document.addEventListener('turbolinks:load', () => {
  const swiper = new Swiper('.swiper-mv', {
    loop: true,
    effect: "fade", //fadeで切り替え
    fadeEffect: {
      crossFade: true
    },
    autoplay: {
      delay: 5000, // 表示秒数
      disableOnInteraction: false,
    },
    speed: 2500, //2.5sでフェードアウト
  });
});