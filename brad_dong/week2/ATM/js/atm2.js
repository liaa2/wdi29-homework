
const $checkingAmountInput = $('#checkingAmount');
const $savingsAmountInput = $('#savingsAmount');

const bank={
  checking:0,
  savings:0,

  totalFunds: function(){
    return this.checking+this.savings;
  },

  deposit: function(amount, account){
    this[account] += amount;
    return this[account];
  },

  withdrawal: function(amount, account){
    if(amount<=this[account]){  //enough money in account
      this[account] -= amount;
      return this[account];
    }else if(amount<=this.totalFunds()){  //overdraft protection
      let otherAccount='checking';
      if(account==='checking'){
        otherAccount = 'savings';
      };
      let remainder = amount - this[account];
      this[account]=0;
      bank[otherAccount] = bank[otherAccount] - remainder;
    };
  },

  displayAmounts: function(){
    $('#balance1').text(`$${this.checking}`);
    if (this.checking!==0){
      $('#balance1').css('backgroundColor', '#e3e3e3');
    }else{
      $('#balance1').css('backgroundColor', 'red');
    };


    $('#balance2').text(`$${this.savings}`);
    if (this.savings!==0){
      $('#balance2').css('backgroundColor', '#e3e3e3');
    }else{
      $('#balance2').css('backgroundColor', 'red');
    }
  },

};    //end of bank object
