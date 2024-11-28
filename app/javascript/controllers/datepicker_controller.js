import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = { disableDates: Array }

  connect() {
    console.log(this.disableDatesValue);
    flatpickr(this.element,{
      disable: this.disableDatesValue,
      dateFormat: "Y-m-d",
    });
  }
}