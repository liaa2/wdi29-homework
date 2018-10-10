

//Function to check decimal places
const checkDecimalPlaces = function(amount){
  let amountSplitOnDot = (amount+"").split(".");
  if ((amountSplitOnDot.length>1 && amountSplitOnDot[1].length <3)||amountSplitOnDot.length===1){
    return true
  }
  return false
};

//Function to check valid input
const checkValidAmount = function(amount){
  if ((amount < 0) || !(typeof amount === "number") || !(checkDecimalPlaces(amount))){
    return false
  }
  return true
};

//Function to get checking balance as jquery and number
const getCheckingBalance = function(){
  const checkingBalance = $('#balance1');
  const checkingBalanceNumber = Number(checkingBalance.html());
  return [checkingBalance, checkingBalanceNumber];
}

//Update the checing balance with the deposit amount
const depositChecking = function(amount){
  const balanceElements = getCheckingBalance();
  const newAmount = (balanceElements[1] + amount).toFixed(2);
  balanceElements[0].html(`${newAmount}`);
  if (Number(newAmount) > 0.00) {
    balanceElements[0].css('background-color','grey');
  }
}

//A function to add money to checking
$('#checkingDeposit').on('click', function(){
  const checkingAmountInput = Number($('#checkingAmount').val());
  if (checkingAmountInput && checkValidAmount(checkingAmountInput)) {
    depositChecking(checkingAmountInput)
  }else return false;
});

//A function to check if we can withdraw this amount
const haveEnoughMoneyChecking = function(amount) {
  if (amount > getCheckingBalance()[1]) {
    return false
  }
  return true
}

//Function to withdraw from the checking account
const withdrawChecking = function(amount){
  const balanceElements = getCheckingBalance();
  const newAmount = (balanceElements[1] - amount).toFixed(2);
  balanceElements[0].html(`${newAmount}`);
  //Updating the background color
  if (Number(newAmount) === 0.00) {
    balanceElements[0].css('background-color','red');
  }
}

//Listener on withdraw checking button
$('#checkingWithdraw').on('click', function(){
  const checkingAmountInput = Number($('#checkingAmount').val());
  if (checkingAmountInput && checkValidAmount(checkingAmountInput) && haveEnoughMoneyChecking(checkingAmountInput)) {
    withdrawChecking(checkingAmountInput)
  }else return false;
});

///NOW THE SAVINGS STUFF

//Function to get savings balance as jquery and number
const getsavingsBalance = function(){
  const savingsBalance = $('#balance2');
  const savingsBalanceNumber = Number(savingsBalance.html().replace("$",""));
  return [savingsBalance, savingsBalanceNumber];
}

//Update the checing balance with the deposit amount
const depositsavings = function(amount){
  const balanceElements = getsavingsBalance();
  const newAmount = (balanceElements[1] + amount).toFixed(2);
  balanceElements[0].html(`$${newAmount}`);
  if (Number(newAmount) > 0.00) {
    balanceElements[0].css('background-color','grey');
  }
}

//A function to add money to savings
$('#savingsDeposit').on('click', function(){
  const savingsAmountInput = Number($('#savingsAmount').val());
  if (savingsAmountInput && checkValidAmount(savingsAmountInput)) {
    depositsavings(savingsAmountInput)
  }else return false;
});

//A function to check if we can withdraw this amount
const haveEnoughMoneysavings = function(amount) {
  if (amount > getsavingsBalance()[1]) {
    return false
  }
  return true
}

//Function to withdraw from the savings account
const withdrawsavings = function(amount){
  const balanceElements = getsavingsBalance();
  const newAmount = (balanceElements[1] - amount).toFixed(2);
  balanceElements[0].html(`$${newAmount}`);
  //Updating the background color
  if (Number(newAmount) === 0.00) {
    balanceElements[0].css('background-color','red');
  }
}

//Listener on withdraw savings button
$('#savingsWithdraw').on('click', function(){
  const savingsAmountInput = Number($('#savingsAmount').val());
  if (savingsAmountInput && checkValidAmount(savingsAmountInput) && haveEnoughMoneysavings(savingsAmountInput)) {
    withdrawsavings(savingsAmountInput)
  }else return false;
});

/*
Some notes
//Can get the val from the button itself to minimise code
//use isNaN for checkign
*/

/*
Title: GA ATM App
Summary
This lab will help you practice JavaScript functions and manipulating the DOM with jQuery.
You'll be selecting elements, manipulating HTML, and manipulating style along with building out the logic using JavaScript.
Objectives:
DOM selection, appending, removal, updating
code organisation: separation of concerns, i.e. display logic vs. business logic
Specification:
Keep track of the checking and savings balances somewhere
Add functionality so that a user can deposit money into one of the bank accounts.
Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.
Add functionality so that a user can withdraw money from one of the bank accounts.
Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.
Make sure the balance in an account can't go negative. If a user tries to withdraw more money than exists in the account, ignore the transaction.
When the balance of the bank account is $0 the background of that bank account should be red. It should be gray when there is money in the account.
What happens when the user wants to withdraw more money from the checking account than is in the account? These accounts have overdraft protection, so if a withdrawal can be covered by the balances in both accounts, take the checking balance down to $0 and take the rest of the withdrawal from the savings account. If the withdrawal amount is more than the combined account balance, ignore it.
Make sure there is overdraft protection going both ways.
Are there ways to refactor your code to make it DRYer?
Separation of Concerns
Spend some time thinking about the following before you even start writing code: can you separate

the GUI code (event handlers for form input or buttons)
from

the banking code (deposit and withdrawal between accounts, checking for overdraft etc)
as much as possible?

Ideally you would be able to test all the banking functions from the console, and then connect them to the GUI code with the minimum amount of overlap or points of contact.

These two parts of the system (display logic and business logic) should know as little as possible about each other.
*/
