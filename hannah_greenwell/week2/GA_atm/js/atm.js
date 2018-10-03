// Keep track of the checking and savings balances somewhere.
// Add functionality so that a user can deposit money into one of the bank accounts.
// Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.
// Add functionality so that a user can withdraw money from one of the bank accounts.
// Make sure you are updating the display and manipulating the HTML of the page so a user can see the change.
// Make sure the balance in an account can't go negative. If a user tries to withdraw more money than exists in the account, ignore the transaction.
// When the balance of the bank account is $0 the background of that bank account should be red. It should be gray when there is money in the account.
// What happens when the user wants to withdraw more money from the checking account than is in the account? These accounts have overdraft protection, so if a withdrawal can be covered by the balances in both accounts, take the checking balance down to $0 and take the rest of the withdrawal from the savings account. If the withdrawal amount is more than the combined account balance, ignore it.
// Make sure there is overdraft protection going both ways.
// Are there ways to refactor your code to make it DRYer?

const atm = {

  accounts: {
    savings: 888.00,
    checking: 2500.00,
  },

  // Update the page to display the new balance and change the background of the bank account to red if the balance is 0.
  updateBalance: function(account, newBalance){
    if(newBalance === 0){
      $(`#${account}Account .balance`).addClass('zero');
    } else {
      $(`#${account}Account .balance`).removeClass('zero');
    }

    $(`#${account}Account .balance`).text(`$${newBalance}`);
  },

  depositAmount: function(account, amount){
    const currentBalance = this.accounts[account];
    const newBalance = currentBalance + amount;

    this.accounts[account] = newBalance;
    // REFACTOR: above two lines - this.accounts[account] = currentBalance + amount;
    this.updateBalance(account, newBalance);
  },

  withdrawAmount: function(account, amount){
    const currentBalance = this.accounts[account];
    const newBalance = currentBalance - amount;

    this.accounts[account] = newBalance;
    this.updateBalance(account, newBalance);
  },

  // Before attempting a withdrawl, check that the user has enough funds to complete (1) a normal withdrawl (2) an overdraft protection withdrawl.
  checkOverdraft: function(primaryAccount, amount){
    const primaryBalance = this.accounts[primaryAccount];

    // Check if the amount can be withdrawn from the selected account
    if(primaryBalance > amount){
      this.withdrawAmount(primaryAccount, amount);
    } else {
      // Set the secondary account using the primary account
      const secondaryAccount = (primaryAccount === 'savings') ? 'savings' : 'checking'
      // let secondaryAccount = 'savings';
      // if(primaryAccount === 'savings'){
      //   secondaryAccount = 'checking';
      // }
      const secondaryBalance = this.accounts[secondaryAccount];
      const totalBalance = primaryBalance + secondaryBalance

      // Check if the amount can be withdrawn with overdraft protection
      if( totalBalance > amount){
          this.withdrawAmount(primaryAccount, primaryBalance);
          this.withdrawAmount(secondaryAccount, (amount - primaryBalance));
      } else {
        console.log("Sorry, you don't have enough money.");
        return;
      }
    }
  },

  // Process the transaction according to the selected transaction type and validate user input
  processTransaction: function(account, amount, transactionType){
    // check that the user entered a valid amount
    if(amount && amount > 0){
      if(transactionType === 'Deposit'){
        this.depositAmount(account, amount);
      }
      if(transactionType === 'Withdraw'){
        this.checkOverdraft(account, amount);
      }
    } else {
      console.log('Please enter a correct amount.');
      return;
    }
  },
}; // atm


$(document).ready(function(){
  $('#balance1').text(`$${atm.accounts.checking}`);
  $('#balance2').text(`$${atm.accounts.savings}`);

  $('#checkingDeposit').on('click', function(){
    const amount = parseInt($('#checkingAmount').val());
    const transactionType = $(this).val();
    atm.processTransaction('checking', amount, transactionType);
  });

  $('#checkingWithdraw').on('click', function(){
    const amount = parseInt($('#checkingAmount').val());
    const transactionType = $(this).val();
    atm.processTransaction('checking', amount, transactionType);
  });

  $('#savingsDeposit').on('click', function(){
    const amount = parseInt($('#savingsAmount').val());
    const transactionType = $(this).val();
    atm.processTransaction('savings', amount, transactionType);
  });

  $('#savingsWithdraw').on('click', function(){
    const amount = parseInt($('#savingsAmount').val());
    const transactionType = $(this).val();
    atm.processTransaction('savings', amount, transactionType);
  });

}); // $(document).ready
