import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "dish", "analytics", "highlight" ]


  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log('Hello, stimulus')

  }

  display(event) {
    console.log(event.currentTarget)
    console.log(event.currentTarget.dataset.dashboardIdValue)
    console.log(this.analyticsTarget)
    console.log(this.highlightTarget)

    this.highlightTarget.classList.toggle("active")

    const dishId = event.currentTarget.dataset.dashboardIdValue
    const url = `/dashboard/${dishId}`
    const options = {
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    }

    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        this.analyticsTarget.innerHTML = data.dish
      })
  }
}
