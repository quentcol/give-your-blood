import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement"]

  fire() {
    this.togglableElementTarget.classList.toggle("review-form");
  }
}