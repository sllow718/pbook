import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["popUp", "cards", "bid_amount"];

  connect() {
    console.log("You are connected to the review page.");
  }

  open() {
    this.popUpTarget.classList.toggle("modal");
    this.cardsTarget.classList.toggle("d-none");
    // this.popUpTarget.classList.remove("fade");
    console.log(this.popUpTarget.classList);
    console.log(this.cardsTarget.classList);
  }

  close() {
    // this.cardsTarget.classList.remove("d-none");
    this.popUpTarget.classList.toggle("modal");
    this.cardsTarget.classList.toggle("d-none");
  }
}
