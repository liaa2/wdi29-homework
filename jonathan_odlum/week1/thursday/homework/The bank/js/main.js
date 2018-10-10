console.log('Welcome to the Bank.');

// JavaScript Bank
// In this homework, you'll create a basic bank in Javascript. The bank has many accounts and the following capabilities that you need to write.
//
// Bank
// There is only one bank. This bank has an array of accounts. The bank needs a method that will return the total sum of money in the accounts. It also needs an addAccount method that will enroll a new account at the bank and add it to the array of accounts. There is no need to create additional functions of the bank to delete accounts, etc.
//
// The bank has many accounts. Accounts should be objects that all share a set of common functionality.

// Accounts
// Accounts have a current balance and owner's name. You should be able to deposit or withdraw from an account to change the balance.

// There is no need to write a user interface. Make sure functions return values -- you may also have your functions console.log() values to help you see your code working.
//
// You should write a basic story through a series of JavaScript commands that shows that the methods do indeed work as expected: add some accounts, show the total balance, make some deposits and withdrawals, show the new total balance.
//
// Tips
// Don't overthink this. Shorter code is probably the answer.
//
// Bonus
// Ensure that the accounts cannot have negative values.
// Write a 'transfer' on the bank that allows you to transfer amounts between two accounts.
// Additional
// Begin exploring the JavaScript Koans. Fork, clone and start trying them.

const bank = {
  accounts: [],

  sumMoney: function() {
    let netCash = 0;
    for (let i = 0; i < accounts.length; i ++){
      netCash += accounts[i].funds;
    }
  },

  transfer: function(amount, fromId, toId){
    // this could totally be done using the withdraw and deposit functions, but I wanted custom messages.
    // custom messages could be achieved using those methods if I did the good thing of putting bits in functions and using the return values. This was easier for this small, non-useable application.
      money = parseFloat(amount);
      if (!money || money <= 0){
        console.log("Please enter a valid amount.");

      }else if (money > this.accounts[fromId].funds) {
        console.log("I'm sorry, you don't have enough funds in your account to make this transfer.");

      }else if(fromId < 0 || toId < 0 || fromId > this.accounts.length -1 || toId > this.accounts.length -1 ){
        console.log("I'm sorry, one of the account ID's entered doesn't seem to be in our files.");

      }else {
        this.accounts[fromId].funds -= money;
        this.accounts[toId].funds += money;
        console.log(`$${money} was transferred from ID-${fromId}:${this.accounts[fromId].owner} to ID-${toId}:${this.accounts[toId].owner}`);
      }
  },

  enrollMember: function(name) {
      let account = {
      owner: name,
      funds: 0,

      deposit: function(money){
        money = parseFloat(money);
        if (money && money > 0){
          this.funds += money;
          console.log(`${this.owner} deposited $${money}.`);
          this.seeBalance();
        }else{
          console.log('Deposit failed. Return money and try again.');
        }
      },

      withdraw: function(money){
        money = parseFloat(money);
        if (!money){
          console.log("Please enter a valid amount.");
        }else if (money > this.funds) {
          console.log("I'm sorry, you don't have enough funds in your account to make this withdrawal.");
        }else {
          this.funds -= money;
          console.log(`${this.owner} withdrew $${money}.`);
          this.seeBalance();
        }
      },

      seeBalance: function(){
        console.log(`Current balance is: $${this.funds}`);
      }
    };
    this.accounts.push(account);
    let accId = this.accounts.length-1;
    this.accounts[accId].id = accId;
    console.log(`New Account: ${this.accounts[accId].owner}`);
    console.log(`ID# ${accId}`);
  }
}

bank.enrollMember("hayley");
bank.enrollMember("johnson");
bank.accounts[0].deposit(500);
bank.accounts[1].deposit(700);
bank.transfer(250, 1, 0);



// Credit Card Validation
// You're starting your own credit card business. You've come up with a new way to validate credit cards with a simple function called validateCreditCard that returns true or false.
//
// Here are the rules for a valid number:
//
// Number must be 16 digits, all of them must be numbers
// You must have at least two different digits represented (all of the digits cannot be the same)
// The final digit must be even
// The sum of all the digits must be greater than 16
// The following credit card numbers are valid:
//
// 9999-9999-8888-0000
// 6666-6666-6666-1666
// The following credit card numbers are invalid:
//
// a923-3211-9c01-1112 invalid characters
// 4444-4444-4444-4444 only one type of number
// 1111-1111-1111-1110 sum less than 16
// 6666-6666-6666-6661 odd final number
// Example
// validateCreditCard('9999-9999-8888-0000'); // Returns: true
// Hint: Remove the dashed from the input string before checking if the input credit card number is valid.
//
// Bonus: Return an object indicating whether the credit card is valid, and if not, what the error is
//
// { valid: true, number: 'a923-3211-9c01-1112' }
// { valid: false, number: 'a923-3211-9c01-1112', error: ‘wrong_length’ }
// Double Bonus: Make your credit card scheme even more advanced! What are the rules, and what are some numbers that pass or fail? Ideas: check expiration date! Check out the Luhn Algorithm for inspiration.


const validateCreditCard = function(cardNumber){
  let goodLength = false;
  let twoNumberTypes = false;
  let noLetters = true;
  let digitSum = 0;
  let lastDigitEven = false;

  let cardNumberCut = cardNumber.split('-');
  console.log(cardNumberCut);
  let cardNumberConcat = cardNumberCut.join('');
  console.log(cardNumberConcat);
  let cardNumberArray = cardNumberConcat.split('');
  console.log(cardNumberArray);

  if (cardNumberArray.length === 16){
    goodLength = true;
  }

  for (let i = 0; i < cardNumberArray.length; i++){
    let currentNumber = cardNumberArray[i];
    if ( currentNumber !== cardNumberArray[i+1] && i !== cardNumberArray.length-1){
      console.log(`${currentNumber} ${cardNumberArray[i+1]}`);
      twoNumberTypes = true;
    }
    if ( isNaN(parseFloat(currentNumber))){
      noLetters = false;
    }
    digitSum += parseFloat(currentNumber);
  }

  if (cardNumberArray[cardNumberArray.length-1]%2 ===0){
    lastDigitEven = true;
  }
  let isValid = true;
  let error = '';
  if (!goodLength){
    error = error + ` -Number length incorrect.`;
    isValid = false;
  }
  if (!twoNumberTypes){
    error = error + ` -Only one number.`;
    isValid = false;
  }
  if (!noLetters){
    error = error + ` -Has letters in it.`;
    isValid = false;
  }
  if (digitSum <= 16){
    error = error + ` -Sum isn't high enough.`;
    isValid = false;
  }
  if (!lastDigitEven){
    error = error + ` -Last digit is odd`;
    isValid = false;
  }
  let card = {
    valid: isValid,
    number: cardNumber,
    errors: error
  }
  console.log(card);
}
