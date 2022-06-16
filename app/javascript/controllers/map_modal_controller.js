import { Controller } from "stimulus";

export default class extends Controller {
  // static targets = ["form", "input", "list", "topgrid"];
  static targets = ["modal", "dismiss"];

  openMap = () => {
    // this.modalTarget.classList.add("modal-open");
    console.log("open is called");

    // this.modalTarget.innerHTML +=
    //   '<div class="modal-backdrop fade show"></div>';
  };

  close() {
    document.body.classList.remove("modal-open");
    this.element.removeAttribute("style");
    this.element.classList.remove("show");
    document.getElementsByClassName("modal-backdrop")[0].remove();
  }

  connect() {
    console.log("connected to show page");
  }

  launchMap() {
    console.log("launch map");
    this.modalTarget.classList.add("modal-open");
    this.modalTarget.setAttribute("style", "display: block; margin-top:20vh");
  }

  closeMap() {
    console.log("map close");
    this.modalTarget.classList.remove("modal-open");
    this.modalTarget.setAttribute("style", "display:none;");
  }
}
