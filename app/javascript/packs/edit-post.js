document.addEventListener('turbolinks:load', () => {
  const userId = document.querySelector('.container.body').getAttribute('data-user-id');
  document.querySelectorAll('.edit-post-btn').forEach(button => {
    button.addEventListener('click', () => {
      const postId = button.getAttribute('data-post-id');
      const postTitle = button.getAttribute('data-post-title');
      const postBody = button.getAttribute('data-post-body');
      const postTags = button.getAttribute('data-post-tags');

      const form = document.querySelector('#edit-post-form');
      form.action = `/users/${userId}/posts/${postId}`;
      form.querySelector('[name="post[title]"]').value = postTitle;
      form.querySelector('[name="post[body]"]').value = postBody;
      form.querySelector('[name="post[tag_list]"]').value = postTags;
    });
  });
});
