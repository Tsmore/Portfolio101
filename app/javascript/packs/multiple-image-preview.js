document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.image_upload').forEach(function(input) {
    input.addEventListener('change', function(event) {
      const files = event.target.files;
      const container = document.getElementById('image_preview_container');

      container.innerHTML = ''; // コンテナをクリア

      Array.from(files).forEach(function(file) {
        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.style.maxWidth = '200px';
        img.style.maxHeight = '200px';
        img.onload = function() {
          URL.revokeObjectURL(img.src); // 画像読み込み後にメモリ解放
        }
        container.appendChild(img);
      });
    });
  });
});