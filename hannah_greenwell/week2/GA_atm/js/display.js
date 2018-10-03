
$(document).ready(function(){
  // Display current balances on page load
  $('#balance1').text(`$${atm.accounts.checking}`);
  $('#balance2').text(`$${atm.accounts.savings}`);

  // Clear amount input field on focus
  $('input[type=text]').on('focus', function(){
    $(this).val('');
  });

  $('#checkingAccount input[type=button]').on('click', function(){
    const amount = parseInt($('#checkingAmount').val());
    const transactionType = $(this).val();
    atm.processTransaction('checking', amount, transactionType);
  });

  $('#savingsAccount input[type=button]').on('click', function(){
    const amount = parseInt($('#savingsAmount').val());
    const transactionType = $(this).val();
    atm.processTransaction('savings', amount, transactionType);
  });
}); // $(document).ready

// Move line 9 to line 16 and change 'this' to target the text input field
