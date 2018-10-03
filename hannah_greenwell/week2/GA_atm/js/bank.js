
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

  // Could change depositAmount & withdrawAmount to updateBalance and multiply the amount by -1 if withdrawl.
  depositAmount: function(account, amount){
    const currentBalance = this.accounts[account];
    const newBalance = currentBalance + amount;

    this.accounts[account] = newBalance;
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
      const secondaryAccount = (primaryAccount === 'savings') ? 'checking' : 'savings';
      const secondaryBalance = this.accounts[secondaryAccount];
      const totalBalance = primaryBalance + secondaryBalance;

      // Check if the amount can be withdrawn with overdraft protection
      if((totalBalance) > amount){
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
      if(transactionType === 'DEPOSIT'){
        this.depositAmount(account, amount);
      }
      if(transactionType === 'WITHDRAW'){
        this.checkOverdraft(account, amount);
      }
    } else {
      console.log('Please enter a correct amount.');
      return;
    }
  },
}; // atm
