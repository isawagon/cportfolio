import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "results", "coins" ]




  connect() {
    console.log("Hello from search-crypto Stimulus controller")
    // au connect afficher les 7 plus gros market cap ?
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
          <div class="flex-item card-coin-logo">        Logo    </div>
          <div class="flex-item card-coin-infos-left">  Symbol  </div>
          <div class="flex-item card-coin-infos-left">  Name    </div>
          <div class="flex-item card-coin-infos-right"> Rank    </div>
          <div  class="flex-item card-coin-infos-left"> Select  </div>
        </div>
    </li>`
    this.resultsTarget.insertAdjacentHTML("beforeend", cryptoTag)



    coins.forEach((value) => {
      const geckoCoin = value["id"]
      const symbol = value["symbol"]
      const name = value["name"]
      const imageUrl = value["large"]
      const marketCapRank = value["market_cap_rank"]


      const cryptoTag = `
        <li class="list-group-item border-0">
          <div class="d-flex">
            <%=escape_javascript simple_form_for([@portfolio, @coin], portfolio_coins_path(@portfolio)) do |f| %>
            <div class="flex-item card-coin">
              <div class="flex-item card-coin-logo"> <image src="${imageUrl}" alt="${name}"> </div>
              <div class="flex-item card-coin-infos-left">       ${symbol}              </div>
              <div class="flex-item card-coin-infos-left">       ${name}                </div>
              <div class="flex-item card-coin-infos-right">      ${marketCapRank}       </div>
              <div class="flex-item card-coin-infos-right" >     ${geckoCoin}          </div>
            </div>
            <%= escape_javascript f.input:%> 
            <%= escape_javascript f.button :submit, "AJOUTER" %>

          </div>
        </li>`
        this.resultsTarget.insertAdjacentHTML("beforeend", cryptoTag)

    })

  }
}
