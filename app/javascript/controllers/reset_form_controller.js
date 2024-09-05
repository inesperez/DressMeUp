import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
  static targets = [ "button" ]

  connect() {
    console.log('connected');
  }

  reset() {
    console.log('resetting');
    this.element.reset()
    setTimeout(() => {
      console.log(this.buttonTarget);
      this.buttonTarget.classList.remove('disabled');
    }, 5000 );
    console.log(this.element);
  }
}
