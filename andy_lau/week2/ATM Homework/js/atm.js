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
//   What happens when the user wants to withdraw more money from the checking account than is in the account?
//   These accounts have overdraft protection, so if a withdrawal can be covered by the balances in both accounts,
//   take the checking balance down to $0 and take the rest of the withdrawal from the savings account.
//   If the withdrawal amount is more than the combined account balance, ignore it.
// Make sure there is overdraft protection going both ways.
// Are there ways to refactor your code to make it DRYer?
//
// Separation of Concerns
// Spend some time thinking about the following before you even start writing code: can you separate
//
// the GUI code (event handlers for form input or buttons)
// from
//
// the banking code (deposit and withdrawal between accounts, checking for overdraft etc)
// as much as possible?
//
// Ideally you would be able to test all the banking functions from the console,
// and then connect them to the GUI code with the minimum amount of overlap or points of contact.
//
// These two parts of the system (display logic and business logic) should know as little as possible about each other.


const bank = {
  checking: 0,
  savings: 0,

  totalBalance: function() {
    return this.checking + this.savings;
  },

  deposit: function(amount, account) {
    if (amount > 0) {
      this[account] += amount;
      return this[account];
    } else {
      return;
    }
  },

  withdraw: function(amount, account) {
    if (amount <= 0) {
      return;
    }

    let differenceOverdraw = amount - this[account];

    if (amount <= this.totalBalance() && (account === "checking")) { //checking version
      if (amount > this[account]) {
        bank.savings = bank.savings - differenceOverdraw;
      }
      this[account] = Math.max(0, (this[account] - amount));
    } else if (amount <= this.totalBalance() && (account === "savings")) { //savings version
      if (amount > this[account]) {
        bank.checking = bank.checking - differenceOverdraw;
      }
      this[account] = Math.max(0, (this[account] - amount));
    } else {
      return;
    }
  },
};

$(document).ready(function() {

  $('.balance').css('background-color', 'red');

  const checkBgColor = function () {
    if (bank.checking === 0) {
      $('#balance1').css('background-color', 'red');
    } else if (bank.checking > 0) {
      $('#balance1').css('background-color', '#E3E3E3')
    };

    if (bank.savings === 0) {
      $('#balance2').css('background-color', 'red');
    } else if (bank.savings > 0) {
      $('#balance2').css('background-color', '#E3E3E3');
    };
  };


  const updateBalanceHtml = function () {
    $('#balance1').html(`$${bank.checking.toFixed(2)}`);
    $('#balance2').html(`$${bank.savings.toFixed(2)}`);
  };

  //deposit for checking
  $('#checkingDeposit').on('click', function() {
    bank.deposit(parseFloat($('#checkingAmount').val()), 'checking');
    // bank.deposit(Number(parseFloat($('#checkingAmount').val()).toFixed(2)), 'checking');
    $('#savingsAmount').val('');
    $('#checkingAmount').val('');
    updateBalanceHtml();
    checkBgColor();
  });

   //withdraw for checking
  $('#checkingWithdraw').on('click', function() {
   bank.withdraw(parseFloat($('#checkingAmount').val()), 'checking');
   $('#savingsAmount').val('');
   $('#checkingAmount').val('');
   updateBalanceHtml();
   checkBgColor();
  });

    //deposit for savings
  $('#savingsDeposit').on('click', function() {
    bank.deposit(parseFloat($('#savingsAmount').val()), 'savings');
    $('#savingsAmount').val('');
    $('#checkingAmount').val('');
    updateBalanceHtml();
    checkBgColor();
  });

     //withdraw savings
  $('#savingsWithdraw').on('click', function() {
   bank.withdraw(parseFloat($('#savingsAmount').val()), 'savings');
   $('#savingsAmount').val('');
   $('#checkingAmount').val('');
   updateBalanceHtml();
   checkBgColor();
  });

  // $('.balance [input="submit"]').on('click', functin () {
  //   checkBgColor();
  //   updateBalanceHtml();
  // });

}); // ready function;


//
//   // $('#checkingAccount :button').on('click', checkingBalance);
//   //
//   // $('#savingsAccount :button').on('click', function(){
//   //   gaBank.deposit(this.input.val(), account)
//   // });
//   // $('#checkingWithdraw').on('click', function() {
//   //   checkingBalance = checkingBalance - parseInt($('#checkingAmount').val());
//   //   $('#balance1').html(`$${checkingBalance}`);
//   // });
//   //
//   // $('#checkingDeposit').on('click', function() {
//   //   checkingBalance = checkingBalance + parseInt($('#checkingAmount').val());
//   //   $('#balance1').html(`$${checkingBalance}`);
//   // });
//   //
//   // $('#savingsDeposit').on('click', function() {
//   //   savingsBalance = savingsBalance + parseInt($('#savingsAmount').val());
//   //   $('#balance2').html(`$${savingsBalance}`);
//   // });
//   //
//   // $('#savingsWithdraw').on('click', function() {
//   //   savingsBalance = savingsBalance - parseInt($('#savingsAmount').val());
//   //   $('#balance2').html(`$${savingsBalance}`);
//   // });
//
