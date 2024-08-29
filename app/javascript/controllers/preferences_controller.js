import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preferences"
export default class extends Controller {
  static targets = ["customOccasion", "occasion"];

  connect() {
    console.log("Hello from preferences")
  }

  fire(event) {

    console.log(event)
    const selectedValue = this.occasionTarget.value;
    if (selectedValue === "Other (please specify)") {
      this.customOccasionTarget.classList.remove("d-none");
    }
  }
}
