// app/javascript/service_form_validation.js
// This script is used to validate the service form on the new service modal
// It checks if the price is a positive number and shows an error message if it's not
// Could have done stimulus but lazy :)

document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("#new_service_form");
    if (form) {
      form.addEventListener("submit", function(event) {
        let valid = true;
        const price = form.querySelector("#service_price");
  
        // Clear previous errors
        form.querySelectorAll(".error-message").forEach(el => el.remove());
  
        // Validate price
        if (isNaN(price.value) || price.value <= 0) {
          showError(price, "Price must be a number");
          valid = false;
        }
  
        if (!valid) {
          event.preventDefault(); // Prevent form submission if invalid
        }
      });
  
      function showError(input, message) {
        const error = document.createElement("div");
        error.className = "error-message";
        error.style.color = "red";
        error.textContent = message;
        input.parentElement.appendChild(error);
      }
    }
  });