import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = ["form", "input", "results", "geckoCoin" ]


  connect() {
    console.log("Hello from save-crypto Stimulus controller")
  }

  myFunction(geckoCoin) {

    console.log("Hello from save-crypto myFunction")
    console.log("la coin sélectionnée doit être enregistrée dans le portefeuille")
    console.log(geckoCoin)
    // const token =  localStorage.getItem("token")
    // fetch(`http://localhost:3000/coins`, {
    //   method:"POST",
    //   headers: {authorization:`Bearer ${token}`},
    //   body: JSON.stringify({geckoCoin})
    // }).then((result) => {
    //   console.log(result)
    // }).catch((error)=> {
    //   console.log(error)
    // })
  }
}
