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

document.addEventListener('turbolinks:load', function() {
  setupImageUpload('.image_upload', 'image_preview_container');
  setupImageUpload('.edit_image_upload', 'edit_image_preview_container');
});

function setupImageUpload(uploadClass, previewContainerID) {
  document.querySelectorAll(uploadClass).forEach(function(input) {
    input.addEventListener('change', function(event) {
      const files = event.target.files;
      const container = document.getElementById(previewContainerID);

      container.innerHTML = '';

      Array.from(files).forEach(function(file) {
        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.style.maxWidth = '200px';
        img.style.maxHeight = '200px';
        img.style.display = 'inline-block';
        img.style.objectFit = 'cover';
        img.onload = function() {
          URL.revokeObjectURL(img.src);
        }
        container.appendChild(img);
      });
    });
  });
}
