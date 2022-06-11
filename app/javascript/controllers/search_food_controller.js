import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "input", "list", "topgrid"];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.listTarget);
    console.log("Connected");
    console.log(this.topgridTarget.classList);
    console.log(this.bottomgridTarget.classList);
  }

  update(event) {
    e.preventdefault();
    console.log(this.topgridTarget.classList);
    this.topgridTarget.classList.add("d-none");
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(url, { headers: { Accept: "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });
  }
}
