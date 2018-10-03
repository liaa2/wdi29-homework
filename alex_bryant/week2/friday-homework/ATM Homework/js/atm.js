// Title: GA ATM App
console.log("GA ATM App");
console.log("ATM loaded");
// Summary
// This lab will help you practice JavaScript functions and manipulating the DOM with jQuery.
// You'll be selecting elements, manipulating HTML, and manipulating style along with building out the logic using JavaScript.

// Objectives:
// DOM selection, appending, removal, updating
// code organisation: separation of concerns, i.e. display logic vs. business logic

// Specification:
// Keep track of the checking and savings balances somewhere
// Add functionality so that a user can deposit money into one of the bank accounts.
// Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.
// Add functionality so that a user can withdraw money from one of the bank accounts.
// Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.
// Make sure the balance in an account can't go negative. If a user tries to withdraw more money than exists in the account, ignore the transaction.
// When the balance of the bank account is $0 the background of that bank account should be red. It should be gray when there is money in the account.
// What happens when the user wants to withdraw more money from the checking account than is in the account? These accounts have overdraft protection, so if a withdrawal can be covered by the balances in both accounts, take the checking balance down to $0 and take the rest of the withdrawal from the savings account. If the withdrawal amount is more than the combined account balance, ignore it.
// Make sure there is overdraft protection going both ways.
// Are there ways to refactor your code to make it DRYer?

// Separation of Concerns
// Spend some time thinking about the following before you even start writing code: can you separate
// the GUI code (event handlers for form input or buttons)
// from
// the banking code (deposit and withdrawal between accounts, checking for overdraft etc)
// as much as possible?

// Ideally you would be able to test all the banking functions from the console, and then connect them to the GUI code with the minimum amount of overlap or points of contact.
// These two parts of the system (display logic and business logic) should know as little as possible about each other.

const bankOfGA = {
  checkingAccount: {
    balance: 0.00
  },
  savingsAccount: {
    balance: 0.00
  },
  roundTwoDecimals: function (amt) {
    // if(typeof(amt) === "string") {
    //   amt = parseFloat(amt);
    // }
    return Math.round(amt * 100) / 100;
  },
  checkIfOverdrawn: function (amt) {
    return Math.sign(amt) === -1;
  },
  overdraughtProtection: function(account, amt) {
    if(account === "checking") {
      this.savingsAccount.balance += (amt + this.checkingAccount.balance);
      this.savingsAccount.balance = this.roundTwoDecimals(this.savingsAccount.balance);
      this.checkingAccount.balance = 0.00;
      controller.updateScreenBalance("savings",controller.getCorrectBalance("savings"));
    } else if (account === "savings") {
      this.checkingAccount.balance += (amt + this.savingsAccount.balance);
      this.checkingAccount.balance = this.roundTwoDecimals(this.checkingAccount.balance);
      this.savingsAccount.balance = 0.00;
      controller.updateScreenBalance("checking",controller.getCorrectBalance("checking"));
    }
  },
  updateCorrectAccount: function(account, amt) {
    if(account === "checking") {
      this.checkingAccount.balance += amt;
      this.checkingAccount.balance = this.roundTwoDecimals(this.checkingAccount.balance);
    } else if (account === "savings") {
      this.savingsAccount.balance += amt;
      this.savingsAccount.balance = this.roundTwoDecimals(this.savingsAccount.balance);
    }
  },
  updateBalance: function (amt, account) {
    //console.log(`amount: ${amt}, account: ${account}`);
    //round the amount to 2 decimal places
    amt = this.roundTwoDecimals(amt);
    //Check if overdrawn and act accordingly
    const overdrawn = this.checkIfOverdrawn(controller.getCorrectBalance(account) + amt);
    if(overdrawn){
      const bothAccountsTotal = this.checkingAccount.balance + this.savingsAccount.balance;
      if (bothAccountsTotal >= Math.abs(amt)) {
        console.log("Overdraught protection");
        this.overdraughtProtection(account, amt);
      } else {
        console.log("Cannot process the transaction");
      }
    } else {
      this.updateCorrectAccount(account, amt);
    }
  },
  processTransaction: function (transaction) {
    let amount = transaction.amount;
    //Determining if the amount is a deposit or a withdrawal
    if (!transaction.deposit) {
      amount *= -1;
    }
    // update appropriate balance
    this.updateBalance(amount, transaction.account);
    //this.logStatus();
    controller.updateScreenBalance(transaction.account,controller.getCorrectBalance(transaction.account));
  },
  logStatus: function () {
    console.log(`Checking balance: ${this.checkingAccount.balance}`);
    console.log(`Checking overdrawn: ${this.checkIfOverdrawn(this.checkingAccount.balance)}`);
    console.log(`Savings balance: ${this.savingsAccount.balance}`);
    console.log(`Savings overdrawn: ${this.checkIfOverdrawn(this.savingsAccount.balance)}`);
  }
}
