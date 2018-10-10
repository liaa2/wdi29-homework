
$(document).ready(function(){

  $('#checkingDeposit').on('click', function(){
    let amount = parseFloat($checkingAmountInput.val());  //grab amount entered by user, change to number
    bank.deposit(amount, 'checking');   //run method
    bank.displayAmounts();    //update amounts
    $checkingAmountInput.val(''); //clear input field
  });

  $('#savingsDeposit').on('click', function(){
    let amount = parseFloat($savingsAmountInput.val());
    bank.deposit(amount, 'savings');
    bank.displayAmounts();
    $savingsAmountInput.val('');
  });

  $('#checkingWithdraw').on('click', function(){
    let amount = parseFloat($checkingAmountInput.val());
    bank.withdrawal(amount, 'checking');
    bank.displayAmounts();
    $checkingAmountInput.val('');

  });

  $('#savingsWithdraw').on('click', function(){
    let amount = parseFloat($savingsAmountInput.val());
    bank.withdrawal(amount, 'savings');
    bank.displayAmounts();
    $savingsAmountInput.val('');

  });

});
