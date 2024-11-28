import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept"
export default class extends Controller {
  static targets = ["acceptbutton", "declinebutton"]

  connect() {
    console.log("connected!");
  }

  accept() {
    console.log("connected~~~");
    // this.acceptButtonTarget.classList.add("d-none");
  }

}
