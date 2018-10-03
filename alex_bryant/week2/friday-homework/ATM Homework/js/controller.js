console.log("Controller loaded");

const controller = {
  updateScreenBalance: function (account, amount) {
    viewOfAccounts.updateScreenBalance(account, amount);
  },
  processTransaction: function (transaction) {
    const validTrans = this.checkValidity(transaction.amount);
    if (validTrans) {
      bankOfGA.processTransaction(transaction);
    }
  },
  checkValidity: function (amount) {
    const amountSplt = amount.split(".");
    //check if ammount is valid cash amount
    if (amountSplt.length === 2){
      if (!isNaN(parseInt(amountSplt[0]))
        && !isNaN(parseInt(amountSplt[1]))
        && (amountSplt[1].length === 2 || amountSplt[1].length === 1)) {
        return true;
      }
    }
    if (amountSplt.length === 1){
      if (!isNaN(parseInt(amountSplt[0]))) {
        //console.log(isNaN(parseInt(amountSplt[0])));
        return true;
      }
    }
    console.log("Invalid input amount");
    return false;
  },
  getCorrectBalance: function (account) {
    if (account === "savings") {
      return bankOfGA.savingsAccount.balance;
    } else if (account === "checking"){
      return bankOfGA.checkingAccount.balance;
    }
  }
}
