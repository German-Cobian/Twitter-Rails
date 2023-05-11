import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hashtag"
export default class extends Controller {
  connect() {
    this.element.addEventListener("click", (_) => {
      Turbo.visit(this.element.dataset.url)
    });
  }
}
