import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["navbarToggle", "uploadForm"]
  connect() {
    console.log("upload modal connected")
  }

  toggle() {
    this.uploadFormTarget.classList.toggle("d-none")
  }
}
