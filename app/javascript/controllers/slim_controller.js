import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

// Connects to data-controller="slim"
export default class extends Controller {
  connect() {
    this.slimSelect = new SlimSelect({
      select: this.element,
      showSearch: true, // Optional
      settings: {
        addToBody: false, // Prevent Slim Select from appending to <body>
      },
    });
  }
}
