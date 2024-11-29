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
    console.log("it works?")

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
          } else if (data.action === "removed") {
            this.iconTarget.classList.add("fa-regular");
            this.iconTarget.classList.remove("fa-solid");
          }
        } else {
          console.error(data.message);
        }
      })
      .catch((error) => console.error("Error:", error));
  }
}