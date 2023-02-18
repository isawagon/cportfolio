import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = ['coinIn', 'amountIn', 'stockIn', 'results']

  connect() {
    console.log("***CONNECTED", this.element)
    console.log("***This is the content target", this.contentTarget)
  }

  disable() {
    console.log("***controller action disable")
    this.element.innerText = "Bingo!"
    this.element.setAttribute("disabled", "")
  }

  recap() {
    console.log("***controller action recap")
    console.log('ok1?')
    const coinIn = this.coinInTarget.value
    console.log('ok2?')
    console.log(coinIn)
    console.log('ok3?')
    const amountIn = this.amountInTarget.value
    // const amountIn = parseInt(this.amountInTarget.value)
    console.log(amountIn)
    console.log('ok4?')
    this.insertstockprice(coinIn, amountIn)
  }
  insertstockprice(coinIn, amountIn) {
    const tag = `${coinIn}
    <%= escape-javascript @coins[${coinIn}].stock%>
       <%= @coins[${coinIn}].price%>
      `

    this.resultsTarget.innerText = tag
  }

}
