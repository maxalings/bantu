document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.favorite-icon').forEach(function(element) {
    element.addEventListener('click', function(event) {
      event.preventDefault();
      toggleFavoriteIcon(this);
    });
  });
});

function toggleFavoriteIcon(element) {
  console.log('Icon clicked');
  const icon = element.querySelector('i');
  icon.classList.toggle('fa-regular');
  icon.classList.toggle('fa-solid');
}
