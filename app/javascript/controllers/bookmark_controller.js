import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "bookmarkIcon" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log('time for bookmarking')
  }


  bookmark() {
    this.bookmarkIconTarget.style.color = '#FF3757';
    // get the item that has been clicked
    // get the user who clicked
    // change the favourited status of the item
    // link the clicker to the item

  }
}
