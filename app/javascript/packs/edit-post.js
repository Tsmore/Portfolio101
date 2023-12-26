document.addEventListener('turbolinks:load', () => {
  // CSRFトークンの値を取得
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const container = document.querySelector('.container.body');
  if (container) {
    const userId = container.getAttribute('data-user-id');

    document.querySelectorAll('.edit-post-btn').forEach(button => {
      button.addEventListener('click', () => {
        const postId = button.getAttribute('data-post-id');
        const postTitle = button.getAttribute('data-post-title');
        const postBody = button.getAttribute('data-post-body');
        const postTags = button.getAttribute('data-post-tags');

        const form = document.querySelector('#edit-post-form');
        if (form) {
          form.action = `/users/${userId}/posts/${postId}`;

          // フォームフィールドに値を設定
          const titleField = form.querySelector('[name="post[title]"]');
          const bodyField = form.querySelector('[name="post[body]"]');
          const tagsField = form.querySelector('[name="post[tag_list]"]');

          if (titleField) titleField.value = postTitle;
          if (bodyField) bodyField.value = postBody;
          if (tagsField) tagsField.value = postTags;

          // CSRFトークンを隠しフィールドとしてフォームに追加
          const hiddenInput = document.createElement('input');
          hiddenInput.type = 'hidden';
          hiddenInput.name = 'authenticity_token';
          hiddenInput.value = csrfToken;
          form.appendChild(hiddenInput);
        }
      });
    });
  }
});
