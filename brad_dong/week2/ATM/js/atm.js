const backgroundColour1 = function(){
  if($balance1===0){
    $('#balance1').css('backgroundColor', 'red');
  }else{
    $('#balance1').css('backgroundColor', '#e3e3e3');
  }
};

const backgroundColour2 = function(){
  if($balance2===0){
    $('#balance2').css('backgroundColor', 'red');
  }else{
    $('#balance2').css('backgroundColor', '#e3e3e3');
  }
}

//LEFT HAND SIDE

const $checkingAmountInput = $('#checkingAmount');  //checking input field as number

const $checkingDeposit = $('#checkingDeposit');   //check dep button

const $checkingWithdraw = $('#checkingWithdraw');  //check with button

let $balance1 = parseFloat($('#balance1').text());    //numerical value of checking balance

const checkAdd = function(){
  $balance1 = $balance1 + parseFloat($checkingAmountInput.val());
  $('#balance1').text(`$${$balance1}`);
  backgroundColour1();
};

const checkMinus = function(){
  if(($balance1 - parseFloat($checkingAmountInput.val()))>=0){
    $balance1 = $balance1 - parseFloat($checkingAmountInput.val());
    $('#balance1').text(`$${$balance1}`);
    backgroundColour1();
  }
};

//RIGHT HAND SIDE

const $savingsAmountInput = $('#savingsAmount');  //checking input field as number

const $savingsDeposit = $('#savingsDeposit');   //check dep button

const $savingsWithdraw = $('#savingsWithdraw');  //check with button

let $balance2 = parseFloat($('#balance2').text());    //numerical value of checking balance

const savingsAdd = function(){
  $balance2 = $balance2 + parseFloat($savingsAmountInput.val());
  $('#balance2').text(`$${$balance2}`);
  backgroundColour2();
};

const savingsMinus = function(){
  if(($balance2 - parseFloat($savingsAmountInput.val()))>=0){
    $balance2 = $balance2 - parseFloat($savingsAmountInput.val());
    $('#balance2').text(`$${$balance2}`);
    backgroundColour2();
  }
};

$(document).ready(function(){

  $checkingDeposit.on('click', checkAdd);
  $checkingWithdraw.on('click', checkMinus);
  $savingsDeposit.on('click', savingsAdd);
  $savingsWithdraw.on('click', savingsMinus);

});   //end of document ready function
