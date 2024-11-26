import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["view", "edit"]

  toggle() {
    this.viewTarget.classList.add("d-none")
    this.editTarget.classList.remove("d-none")
  }
}