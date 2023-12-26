document.addEventListener('turbolinks:load', () => {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const userId = document.querySelector('.container.body').getAttribute('data-user-id');

  document.querySelectorAll('.edit-cat-btn').forEach(button => {
    button.addEventListener('click', () => {
      const catId = button.getAttribute('data-cat-id');
      const catName = button.getAttribute('data-cat-name');
      const catIntroduction = button.getAttribute('data-cat-introduction');
      const catBreedId = button.getAttribute('data-cat-breed-id');
      const catSex = button.getAttribute('data-cat-sex');
      const catBirth = button.getAttribute('data-cat-birth');

      const form = document.querySelector('#edit-cat-form');
      form.action = `/users/${userId}/cats/${catId}`;
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
      form.querySelector('[name="cat[name]"]').value = catName;
      form.querySelector('[name="cat[introduction]"]').value = catIntroduction;
      form.querySelector('[name="cat[breed_id]"]').value = catBreedId;
      form.querySelector('[name="cat[sex]"]').value = catSex;
      form.querySelector('[name="cat[date_of_birth]"]').value = catBirth;

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
