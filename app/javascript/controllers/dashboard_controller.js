import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "dish" ]
  static values = { id: String }

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log('Hello, stimulus')

  }

  display(event) {
    const to_post = this.idValue
    console.log(to_post)

    const url = '/dashboard'
    const options = {
      method: "POST",
      headers: { "Accept": 'text/html' },
      body: to_post,
    }

    fetch(url, options)
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }
}
