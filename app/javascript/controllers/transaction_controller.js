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
    const coinIn = this.coinInTarget.value
    const amountIn = this.amountInTarget.value ? this.amountInTarget.value :0
    // const amountIn = parseInt(this.amountInTarget.value)
    console.log('saisie: coin ', coinIn, 'amount ', amountIn)
    // constitution du tableau
    let tableau = [];
    let indices = [];
    const ids = document.querySelectorAll("#id li");
    let tcoin = [];
    ids.forEach((item) => {
      tcoin = []
      tcoin.push(item.innerText);
      indices.push(item.innerText);
      tableau.push(tcoin);
    });
    console.log(tableau);

    const symbols = document.querySelectorAll("#symbol li");
    let j = 0;
    symbols.forEach((item) => {
      tableau[j][1] = item.innerText;
      j = j+1;
    });

    const stocks = document.querySelectorAll("#stock li");
    j = 0;
    stocks.forEach((item) => {
      tableau[j][2] = item.innerText;
      j = j+1;
    });
    const prices = document.querySelectorAll("#price li");
    j = 0;
    prices.forEach((item) => {
      tableau[j][3] = item.innerText;
      j = j+1;
    });
    console.log(tableau);
    console.log(indices);
    // fin constitution du tableau
    this.insertstockprice(coinIn, amountIn, tableau, indices)
  }

  insertstockprice(coinIn, amountIn, tableau, indices) {


    //rechercher l'index de coinIn
    console.log(indices.indexOf(coinIn));
    let k = indices.indexOf(coinIn);
        console.log('ok5?');
    //rechercher le stock et le price par l'index
    let symbol = tableau[k][1];
    let stockBefore = tableau[k][2];
    let price = tableau[k][3];
    console.log(stockBefore);
    console.log(price);
    console.log('ok6?');
    //calculer la contrevaleur amountIn * price
    let estimated = amountIn * price;
    console.log(estimated);
    estimated = Number.parseFloat(estimated).toFixed(2);
    console.log('ok7?');
    //calculer stockAfter = stock + AmountIn
    let stockAfter = Number.parseFloat(stockBefore)+ Number.parseFloat(amountIn);
    console.log(stockAfter);
    console.log('ok8?')
    //renvoyer une ligne avec contrevaleur, stock et stockAfter
    console.log('stock before',typeof(stockBefore), stockBefore);
    console.log('stock after', typeof(stockAfter), stockAfter);
    console.log('amount IN', typeof(amountIn), amountIn);
    console.log('Price', typeof(price), price);
    console.log('estimated', typeof(estimated), estimated);

    const tag = `Estimated ${estimated}€ Stock ${symbol} before ${stockBefore} after ${stockAfter}`
    this.resultsTarget.innerText = tag

  }

}
