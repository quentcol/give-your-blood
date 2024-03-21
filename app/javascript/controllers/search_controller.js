import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["cityInput"];

  search() {
    const cityName = this.cityInputTarget.value;
    // Redirect to the centers page with the city name as a query parameter
    window.location.href = `/centers?query=${encodeURIComponent(cityName)}`;
  }
}