// Title: GA ATM App
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
// Spend some time thinking about the following before you even start writing code: can you separate the GUI code (event handlers for form input or buttons)
// from
// the banking code (deposit and withdrawal between accounts, checking for overdraft etc)
// as much as possible?
//
// Ideally you would be able to test all the banking functions from the console, and then connect them to the GUI code with the minimum amount of overlap or points of contact.
// These two parts of the system (display logic and business logic) should know as little as possible about each other.


// I've used some loops in places that don't make much sense but its because I've attempted to design it for any number of accounts. Theoretically it would be trivial to add more accounts. Features like preferencial accounts for overdraw protection could be implemented, but I havn't done any testing in this regard so I'm sure if I  attempted it something unexpected would break.

console.log("Up and Running");

const Account = function(type){
  this.balance = 0;
  this.type = type;
}

Account.prototype.modifyBalance = function(id){
  const amount = parseInt(this.amount.val());
  if (!isNaN(amount)){
    if (id.includes('D')){ // checks button id for (D)eposit. else its Withdraw.
      this.deposit(amount);
    }else{
      this.withdraw(amount);
    }
  }
  this.updateImage();
}

Account.prototype.deposit = function(value){
  this.balance = this.balance + value;
}

Account.prototype.withdraw = function(amount){
  // If the account is empty don't attempt overdraw.
  if (this.balance <= 0){
    return;
  }
  //if there is enough money, withdraw.
  if (this.balance >= amount){
    this.balance = this.balance - amount;
  }else{ // attempt overdrawProtect.
    this.overdrawProtect(amount);
  }
}

Account.prototype.overdrawProtect = function(amount){
  const remainder = amount - this.balance
  for (let key in bank){ //for every account in the bank.
    //ensure it isnt the initial account and check it has enough money to cover the overdraw.
    if (key !== this.type && bank[key].balance > remainder){
      this.withdraw(this.balance);
      bank[key].withdraw(remainder);
      bank[key].updateImage();
      break;
    }
  }
}

Account.prototype.updateImage = function(){
  const display = interactives[this.type].Balance;
  display.html(this.balance);
  if (this.balance === 0){
    display.css('background-color', '#FF0000');
  }else{
    display.css('background-color', '#E3E3E3');
  }
}

const bank = {
  savings: new Account('savings'),
  checking: new Account('checking'),
}

const interactives = {
  //I've given the different fields capitals to allow one letter checks and account+field appending because I thought it was neat.
  checking: {
    Amount: 0,
    Balance: 0,
    Deposit: 0,
    Withdraw: 0,
  },
  savings: {
    Amount: 0,
    Balance: 0,
    Deposit: 0,
    Withdraw: 0 ,
  },
}

$(document).ready(function(){
  console.log("Ready!");

  //The fact that the balance dispalys had IDs contrary to the convention set by the rest of the page caused me no end of frustration. I didn't want to change them in the html doc because the point of the excercise was to manipulate stuff here.
  //So I 'fixed' them to follow the ID convention here instead.
  $('#balance1').prop('id', 'checkingBalance');
  $('#balance2').prop('id', 'savingsBalance');

  for (let account in interactives){                            // For each account, and then
    for (let input in interactives[account]){                   // for each type of interactive:
      interactives[account][input] = $(`#${account}${input}`);  // Link to corresponding document element.

      if (input.includes('D') || input.includes('W')){          // If its the withdrawal or deposit button
        interactives[account][input].on('click', function(){    // Add a click listener.
          bank[account].modifyBalance(this.id);
        });
      }else if (input.includes('A')){                           // Else if its the Amount input
        bank[account].amount = interactives[account][input];    // link it to the bank.account for updating.
      }
    }
  }
  bank.savings.updateImage();
  bank.checking.updateImage();
});
