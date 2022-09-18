import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "results"]
  connect() {
    console.log("Hello from search-crypto Stimulus controller")
    // this.fetchCrypto("monero")
    // au connect afficher les 7 plus gros market cap
  }
  api(event) {
    event.preventDefault()
    console.log("Hello from search-crypto#api");
    this.resultsTarget.innerHTML = ""
    console.log(this.inputTarget.value);
    const query = this.inputTarget.value;
    this.fetchCrypto(query)
  }
  fetchCrypto(query) {
    fetch(`https://api.coingecko.com/api/v3/search?query=${query}`)
    .then(response => response.json())
    .then(data => this.insertResults(data))

  }

  insertResults(data) {
    const coins = ((data["coins"]))
    const cryptoTag = `<li class="list-group-item border-0">
      <div class="d-flex">
        <div class ="flex-item card-coin" >
          <div class="flex-item card-coin-logo">
            logo
          </div>
          <div class="flex-item card-coin-infos-left">
            symbol
          </div>
          <div class="flex-item card-coin-infos-left">
            name
          </div>
          <div class="flex-item card-coin-infos-right">
            market-cap-rank
          </div>
          <div  class="flex-item card-coin-infos-left">
          Select
          </div>

        </div>
    </li>`
    this.resultsTarget.insertAdjacentHTML("beforeend", cryptoTag)
    coins.forEach((value) => {
      const id = value["id"]
      const symbol = value["symbol"]
      const name = value["name"]
      const url = value["large"]
      const marketcaprank = value["market_cap_rank"]

      const cryptoTag = `
        <li class="list-group-item border-0">
          <div class="d-flex">
            <div class="flex-item card-coin">
              <div class="flex-item card-coin-logo">
                <image src="${url}" alt="${name}" >
              </div>
              <div class="flex-item card-coin-infos-left"  >
              ${symbol}
              </div>
              <div class="flex-item card-coin-infos-left">
              ${name}
              </div>
              <div class="flex-item card-coin-infos-right">
              ${marketcaprank}
              </div>
              <div class="flex-item card-coin-infos-right">
                <div  class="flex-item card-coin-infos-select"
                    data-action="click->select-crypto#select"
                    data-select-crypto-target = "id">
                    ${id}
                </div>
              </div>
            </div>
          </div>
        </li>`
        this.resultsTarget.insertAdjacentHTML("beforeend", cryptoTag)
    })
  }
}
