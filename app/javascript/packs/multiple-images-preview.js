document.addEventListener('turbolinks:load', function() {
  setupImageUpload('.images_upload', 'images_preview_container');
  setupImageUpload('.edit_images_upload', 'edit_images_preview_container');
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
        img.style.width = '50%';
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