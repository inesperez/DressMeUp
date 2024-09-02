import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="garments"
export default class extends Controller {
  static targets = ['itemButton'];

  connect() {
    console.log('garments controller connected')
  }

  toggle(event) {
    // event.preventDefault()
    // console.log(event);
    // console.log(event.currentTarget);
    const div = event.currentTarget;
    // console.log(typeof(event.currentTarget));
    div.querySelector('a').classList.toggle("d-none");


    // event.currentTarget.classList.toggle("d-none")

    // console.log(this.itemButtonTarget);


    // console.log(this.targets.find(itemButtonTarget));

  }

}
