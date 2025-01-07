import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "cart" ]

  connect() {
    console.log("Hello World")
  }

  fire() {
    const cart = this.cartTarget;
    cart.style.display = 'block';
  }
}
