import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
// static targets = ['content']

  connect() {
    console.log("***CONNECTED", this.element)
    console.log("***This is the content target", this.contentTarget)
  }

  disable() {
    console.log("***controller action disable")
    this.element.innerText = "Bingo!"
    this.element.setAttribute("disabled", "")
  }

}
