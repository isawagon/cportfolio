import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["id", "symbol", "name", "url"]
  connect() {
    console.log("Hello from select-crypto Stimulus controller")
  }

  select(event) {
    event.preventDefault()
    console.log("Hello from select-crypto # select ")
    console.log(event.currentTarget.innerHTML);
    //.trim() pour supprimer les blancs avant et après :
    const query = event.currentTarget.innerHTML.trim();
    this.fetchCrypto(query)
  }

  fetchCrypto(query) {
    console.log("hello from select#fetchCrypto")
    console.log(query)
    const url = `https://api.coingecko.com/api/v3/coins/${query}?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false`
    console.log(url)
    // fetch(`https://api.coingecko.com/api/v3/coins/${query}?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false`)
    fetch(url)
    .then(response => response.json())
    .then(data => this.newCoin(data))

  }
  newCoin(data) {
    const id = data["id"]
    const symbol = data["symbol"]
    const name = data["name"]
    const url = (data["image"])["large"]
    this.idTarget.value = id
    this.symbolTarget.value = symbol
    this.nameTarget.value = name
    this.urlTarget.value = url
    console.log(data["id"])
    console.log(data["symbol"])
    console.log(data["name"])
    console.log((data["image"])["large"])

  }
}
