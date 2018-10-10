console.log('Is it a Leap Year?!');

let divisibleBy = function(a, b){
  return a%b === 0
}

let isLeapYear = function(year){
  if((divisibleBy(year, 4) && divisibleBy(year, 100)) || divisibleBy(year, 400)){
    return true;
  }else {
    return false;
  }
}

const askInput = prompt("What year would you like to check?");

if(isLeapYear(askInput)){
  console.log(`%c${askInput} is a leap year.`, 'color: blue;');
}else
{
    console.log(`%c${askInput} is not a leap year.`, 'color: red;');
}
