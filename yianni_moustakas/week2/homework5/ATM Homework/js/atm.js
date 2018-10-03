// # Title: GA ATM App
//
//
// ### Summary
// - This lab will help you practice JavaScript functions and manipulating the DOM with jQuery.
// - You'll be selecting elements, manipulating HTML, and manipulating style along
// with building out the logic using JavaScript.
//
// ### Objectives:
// - DOM selection, appending, removal, updating
//
// ### Specification:
//
// * Keep track of the checking and savings balances somewhere
// * Add functionality so that a user can deposit money into one of the bank accounts.
// * Make sure you are updating the display and manipulating the HTML of the page
// so a user can see the change.
// * Add functionality so that a user can withdraw money from one of the bank accounts.
// * Make sure you are updating the display and manipulating the HTML of the page
// so a user can see the change.
// * Make sure the balance in an account can't go negative. If a user tries to
// withdraw more money than exists in the account, ignore the transaction.
// * When the balance of the bank account is $0 the background of that bank account
// should be red. It should be gray when there is money in the account.
// * What happens when the user wants to withdraw more money from the checking
// account than is in the account? These accounts have overdraft protection, so if
// a withdrawal can be covered by the balances in both accounts, take the checking
// balance down to $0 and take the rest of the withdrawal from the savings account.
// If the withdrawal amount is more than the combined account balance, ignore it.
// * Make sure there is overdraft protection going both ways.
// * Are there ways to refactor your code to make it DRYer?
//
// ___
//
// #### Separation of Concerns
//
// Spend some time thinking about the following before you even start writing code: can you separate the GUI code (event handlers for form input or buttons) from the banking code (deposit and withdrawal between accounts, checking for overdraft etc) as much as possible?
//
// Ideally you would be able to test all the banking functions from the console, and then connect them to the GUI code with the minimum amount of overlap or points of contact.
//
// _These two parts of the system (display logic and business logic) should know as little as possible about each other.

// const bank{
//
//   checkingBalance: parseInt($("#balance1").html),
//   savingsBalance: parseInt($("#balance2").html),
//
//   depositChecking: function (accountName, depositAmount) {
//
//     return checkingBalance += depositAmount;
//   },
//
//   withdrawChecking: function (accountName, withdrawAmount) {
//
//     return checkingBalance -= withdrawAmount;
//   },
//
//   depositSavings: function (accountName, depositAmount) {
//
//     return savingsBalance += depositAmount;
//   },
//
//   withdrawSavings: function (accountName, withdrawAmount) {
//
//     return savingsBalance -= withdrawAmount;
//
//   },
// };
//
//
//
//
// $(document).ready(function (){
//
//
//
//
// }); //end of document ready

// BANK LOGIC

let checkingBalance = 0;
let savingsBalance = 0;
let overdraft = 0;
let total;


//Collect total for overdraft functionality
const getTotal = function() {
  return checkingBalance + savingsBalance;
}

//checking account deposit
const depositChecking = function(dollars) {
  if (isNaN(dollars) === true) {
    alert('Please enter a valid number');
  } else if (dollars < 0) {
    alert("You can't deposit a negative number")
  } else {
    return checkingBalance += dollars;
  }
};

//checking account withdraw
const withdrawChecking = function(dollars) {
  total = getTotal();

  if (!dollars) {
    alert('Please enter a valid number');
  } else if (dollars < 0) {
    alert("Withdraw less than 0?")
  } else if (dollars <= checkingBalance) {
    return checkingBalance -= dollars;
  } else if (dollars >= total) {
    overdraft = dollars - checkingBalance;
    alert(`You are in overdraft: $${overdraft}`)
    savingsBalance -= overdraft;
    return checkingBalance = 0;
  } else {
    alert("Insufficient Funds");
  }
}

//Savings account deposit
const depositSavings = function(dollars) {
  if (isNaN(dollars) === true) {
    alert('Please enter a valid number');
  }  else if (dollars < 0) {
    alert('Deposit should be greater than $0')
  } else {
    return savingsBalance += dollars;
  }
};

//Savings account withdraw
const withdrawSavings = function(dollars) {
  total = getTotal();

  if (isNaN(dollars) === true) {
    alert('Please enter a valid number');
  } else if (dollars < 0) {
    alert("Withdraw less than 0?")
  } else if (dollars <= savingsBalance) {
    return savingsBalance -= dollars;
  } else if (dollars <= total) {
    overdraft = dollars - savingsBalance;
    alert(`You are in overdraft: $${overdraft}`)
    checkingBalance -= overdraft;
    return savingsBalance = 0;
  } else {
    alert("Insufficient funds");
  }
};


// jQuery
$(document).ready(function() {
  let dollars;

//background Color
  const color = function() {
    if (parseInt($("#balance1")) === 0) {
      $("#balance1").css("backgroundColor", "red")
    }
  }

  // Deposit checking account, adds to balance + display
  $('#checkingDeposit').on('click', function() {
    dollars = parseFloat($('#checkingAmount').val());
    depositChecking(dollars);
    $('#balance1').html('$' + checkingBalance);
  });

  // Withdraw checking account, subtracts from balance + display
  $('#checkingWithdraw').on('click', function() {
    dollars = parseFloat($('#checkingAmount').val());
    withdrawChecking(dollars);
    $('#balance1').html('$' + checkingBalance);
    $('#balance2').html('$' + savingsBalance);

  });

  // Deposit savings, adds to balance + display
  $('#savingsDeposit').on('click', function() {

    dollars = parseFloat($('#savingsAmount').val());
    depositSavings(dollars);
    $('#balance2').html('$' + savingsBalance);
  });

  // Withdraw savings, subtract from balance + display
  $('#savingsWithdraw').on('click', function() {
    dollars = parseFloat($('#savingsAmount').val());
    withdrawSavings(dollars);
    $('#balance2').html('$' + savingsBalance);
    $('#balance1').html('$' + checkingBalance);

  });

});
