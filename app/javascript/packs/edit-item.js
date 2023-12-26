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
      form.method = 'post'; // フォームのメソッドをPOSTに設定

      // _method 隠しフィールドの確認と追加
      let hiddenMethodInput = form.querySelector('input[name="_method"]');
      if (!hiddenMethodInput) {
        hiddenMethodInput = document.createElement('input');
        hiddenMethodInput.type = 'hidden';
        hiddenMethodInput.name = '_method';
        form.appendChild(hiddenMethodInput);
      }
      hiddenMethodInput.value = 'patch';

      // 既存のフィールドに値を設定
      form.querySelector('[name="item[name]"]').value = itemName;
      form.querySelector('[name="item[description]"]').value = itemDescription;
      form.querySelector('[name="item[product_link]"]').value = itemProductLink;

      // CSRFトークンの確認と追加
      let csrfInput = form.querySelector('input[name="authenticity_token"]');
      if (!csrfInput) {
        csrfInput = document.createElement('input');
        csrfInput.type = 'hidden';
        csrfInput.name = 'authenticity_token';
        form.appendChild(csrfInput);
      }
      csrfInput.value = csrfToken;
    });
  });
});
