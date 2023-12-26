document.addEventListener('turbolinks:load', () => {
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
          const titleField = form.querySelector('[name="post[title]"]');
          const bodyField = form.querySelector('[name="post[body]"]');
          const tagsField = form.querySelector('[name="post[tag_list]"]');

          if (titleField) titleField.value = postTitle;
          if (bodyField) bodyField.value = postBody;
          if (tagsField) tagsField.value = postTags;
        }
      });
    });
  }
});
