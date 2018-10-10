// console.log('loaded!');//to check whether this files is connected

let checkingBalance = 0;

checkingBalance = $('#checkingAmount[type=text]');?????

$('#checkingDeposit').on ('click',function(){
  console.log('Checking Deposit botton is clicked!');
});

$('#savingsDeposit').on ('click', function(){
  console.log('Saving Deposit botton is clicked!');
});

$('#checkingAmount[type=text]').on('blur', function(){
  console.log(" 'enter an amount' was clicked!");
  console.log($(this).val());
});
