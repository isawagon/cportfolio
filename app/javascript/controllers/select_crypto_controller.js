import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []
  connect() {
    console.log("Hello from select-crypto Stimulus controller")
  }

  select() {
    console.log("Hello from select-crypto # select a coin")
  }
}
