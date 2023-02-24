import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = ['coinIn', 'amountIn', 'stockIn', 'resultsIn',
                   'coinOut', 'amountOut', 'stockOut', 'resultsOut',
                   'coinFees', 'amountFees', 'stockFees', 'resultsFees']

  connect() {
    console.log("***CONNECTED", this.element)
    console.log("***This is the content target", this.contentTarget)
  }

  disable() {
    console.log("***controller action disable")
    this.element.innerText = "Bingo!"
    this.element.setAttribute("disabled", "")
  }

  recapIn() {
    console.log("***controller action recap IN")
    const coinIn = this.coinInTarget.value
    const amountIn = this.amountInTarget.value ? this.amountInTarget.value :0
    // const amountIn = parseInt(this.amountInTarget.value)
    console.log('saisie: coinIn ', coinIn, 'amountIn ', amountIn)
    const portfolioContent = this.portfolioContent();
    console.log(portfolioContent);

    console.log('okIN?');
    // this.insertstockprice(coinIn, amountIn, portfolioContent)
    this.resultsInTarget.innerText = this.insertstockprice(coinIn, amountIn, portfolioContent);
  }

  recapOut() {
    console.log("***controller action recap OUT")
    const coinOut = this.coinOutTarget.value
    const amountOut = this.amountOutTarget.value ? this.amountOutTarget.value * -1 :0
    // const amountIn = parseInt(this.amountInTarget.value)
    console.log('saisie: coinOut ', coinOut, 'amountOut ', amountOut)
    const portfolioContent = this.portfolioContent();
    console.log(portfolioContent);

    console.log('okOUT?');
    // this.insertstockprice(coinIn, amountIn, portfolioContent)
    this.resultsOutTarget.innerText = this.insertstockprice(coinOut, amountOut, portfolioContent);
  }

  recapFees() {
    console.log("***controller action recap Fees")
    const coinFees = this.coinFeesTarget.value
    const amountFees = this.amountFeesTarget.value ? this.amountFeesTarget.value * -1 :0
    // const amountIn = parseInt(this.amountInTarget.value)
    console.log('saisie: coinFees ', coinFees, 'amountFees ', amountFees)
    const portfolioContent = this.portfolioContent();
    console.log(portfolioContent);

    console.log('okFees?');
    // this.insertstockprice(coinIn, amountIn, portfolioContent)
    this.resultsFeesTarget.innerText = this.insertstockprice(coinFees, amountFees, portfolioContent);
  }

  insertstockprice(coin, amount, portfolioContent) {
    //rechercher la crypto dans le portfeuille
    const symbol = portfolioContent[coin].symbol;
    const stockBefore = portfolioContent[coin].stock;
    const price = portfolioContent[coin].price;
    //calculer la contrevaleur amount * price
    let estimated = amount * price;
    estimated = Number.parseFloat(estimated).toFixed(2);
    //calculer stockAfter = stock + Amount
    console.log('REGARDE CES 5 LIGNES')
    console.log('stock before', typeof(stockBefore), stockBefore);
    let stockB = Number.parseFloat(stockBefore);
    console.log('stockB', typeof(stockB), stockB);
    console.log('amount', typeof(amount), amount);
    let amountB = Number.parseFloat(amount);
    console.log('amountB', typeof(amountB), amountB);
    let stockAfter = Number.parseFloat((stockB + amountB).toFixed(10));
    console.log('stock after', typeof(stockAfter), stockAfter);

    // let stockAfter = Number.parseFloat(stockBefore)+ Number.parseFloat(amount);

    //renvoyer une ligne avec contrevaleur, stock et stockAfter
    console.log('symbol ', symbol)
    console.log('stock before', typeof(stockBefore), stockBefore);
    console.log('stock after', typeof(stockAfter), stockAfter);
    console.log('amount', typeof(amount), amount);
    console.log('Price', typeof(price), price);
    console.log('estimated', typeof(estimated), estimated);

    // const tag = `Estimated ${estimated}€ Stock ${symbol} before ${stockBefore} after ${stockAfter}`
    // this.resultsTarget.innerText = tag
    const tag = `Estimated ${estimated}€ Stock ${symbol} before ${stockBefore} after ${stockAfter}`
    return tag

  }

  portfolioContent() {
    // constitution du hash du stock portefeuille
    let tableau = [];

    const ids = document.querySelectorAll("#id li");
    let tcoin = [];
    ids.forEach((item) => {
      tcoin = []
      tcoin.push(item.innerText);
      tableau.push(tcoin);
    });
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

    let portfolioContent = {};
    tableau.forEach((t) => {
      portfolioContent[t[0]] = {symbol: t[1], stock: t[2], price: t[3]}
    });
    return portfolioContent;
  }
}
