document.addEventListener('turbolinks:load', () => {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const userId = document.querySelector('.container.body').getAttribute('data-user-id');

  document.querySelectorAll('.edit-item-btn').forEach(button => {
    button.addEventListener('click', () => {
      const itemId = button.getAttribute('data-item-id');
      const itemName = button.getAttribute('data-item-name');
      const itemDescription = button.getAttribute('data-item-description');
      const itemProductLink = button.getAttribute('data-item-product_link');

      const form = document.querySelector('#edit-item-form');
      form.action = `/users/${userId}/items/${itemId}`;
      form.querySelector('[name="item[name]"]').value = itemName;
      form.querySelector('[name="item[description]"]').value = itemDescription;
      form.querySelector('[name="item[product_link]"]').value = itemProductLink;

      if (!form.querySelector('[name="authenticity_token"]')) {
        const hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'authenticity_token';
        hiddenInput.value = csrfToken;
        form.appendChild(hiddenInput);
      }
    });
  });
});
