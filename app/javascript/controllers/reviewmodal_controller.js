import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "lists"];

  connect() {
    console.log("You are connected to the review page.");
  }

  open() {
    this.listsTarget.classList.toggle("d-none");
    this.formTarget.classList.toggle("d-none");
  }
}
