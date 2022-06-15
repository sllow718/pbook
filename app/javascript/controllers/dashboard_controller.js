import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dish" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log('Hello, stimulus')

  }

  display(event) {
    console.log(event)
  }
}
