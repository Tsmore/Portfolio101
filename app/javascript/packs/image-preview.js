document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.image_upload').forEach(function(input) {
    input.addEventListener('change', function(event) {
      var output = document.getElementById('image_preview');
      output.src = URL.createObjectURL(event.target.files[0]);
      output.onload = function() {
        URL.revokeObjectURL(output.src); // 画像読み込み後にメモリ解放
      }
      output.style.display = 'block';
    });
  });
});
