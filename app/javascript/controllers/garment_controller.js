import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="garments"
export default class extends Controller {
  static targets = ['garmentModal'];

  connect() {
    console.log('garments controller connected')
  }

  toggle(event) {
    event.preventDefault()
    this.garmentModalTarget.classList.toggle("d-none");
  }
}
