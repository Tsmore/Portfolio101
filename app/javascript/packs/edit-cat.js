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
      form.querySelector('[name="cat[name]"]').value = catName;
      form.querySelector('[name="cat[introduction]"]').value = catIntroduction;
      form.querySelector('[name="cat[breed_id]"]').value = catBreedId;
      form.querySelector('[name="cat[sex]"]').value = catSex;
      form.querySelector('[name="cat[date_of_birth]"]').value = catBirth;

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
