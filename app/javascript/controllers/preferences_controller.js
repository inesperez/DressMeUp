import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preferences"
export default class extends Controller {
  static targets = ["customOccasion", "occasion"];

  connect() {
    console.log("Hello from preferences")
  }

  fire(event) {
    const selectedValue = this.occasionTarget.value;
    if (selectedValue === "other") {
      this.customOccasionTarget.classList.remove("d-none");
    }
  }
}
