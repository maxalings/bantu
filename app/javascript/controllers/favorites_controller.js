// document.addEventListener('DOMContentLoaded', function() {
//   document.querySelectorAll('.favorite-icon').forEach(function(element) {
//     element.addEventListener('click', function(event) {
//       event.preventDefault();
//       toggleFavoriteIcon(this);
//     });
//   });
// });

// function toggleFavoriteIcon(element) {
//   console.log('Icon clicked');
//   const icon = element.querySelector('i');
//   icon.classList.toggle('fa-regular');
//   icon.classList.toggle('fa-solid');
// }

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon"];
  connect(){
  }
  

  toggle(event) {
    event.preventDefault();
    const { url } = event.currentTarget.dataset;

    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        if (data.success) {
          if (data.action === "added") {
            
            this.iconTarget.classList.add("fa-solid");
            this.iconTarget.classList.remove("fa-regular");
            this.displayFlash(data.message, "add");
          } else if (data.action === "removed") {
            this.iconTarget.classList.add("fa-regular");
            this.iconTarget.classList.remove("fa-solid");
            this.displayFlash(data.message, "remove");
          }
        } else {
          console.error(data.message);
        }
      })
      .catch((error) => {
        console.error("Error:", error);
        this.displayFlash("An unexpected error occurred. Please try again later.", "error");
      });
  }

  displayFlash(message, type) {
    const flashDiv = document.createElement("div");
    flashDiv.className = `flash flash-${type}`;
    flashDiv.textContent = message;

    const flashContainer = document.querySelector("#flash-container") || document.body;
    flashContainer.appendChild(flashDiv);

    setTimeout(() => flashDiv.remove(), 2000);
  }
}