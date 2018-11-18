// Happy Numbers
// A happy number is defined by the following process:
//
// Starting with any positive integer,
// replace the number by the sum of the squares of its digits, and
// repeat the process until
// the number equals 1 (where it will stay),
// or it loops endlessly in a repeating cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy numbers, while those for which this process do not end in 1 are unhappy numbers.
//
// Task
// Your task is to write a program in Javascript which prints the first 10 happy numbers, starting from 1.
//
// Here are the first 10 happy numbers, for you to compare your output against:
//
// 1
// 7
// 10
// 13
// 19
// 23
// 28
// 31
// 32
// 44

const alreadyChecked = {};

const happyNumbers = numberRequired => {
  console.log(`${numberRequired} happy numbers are required`);
  const happyNumbersArr = [];
  //Starting number
  let counter = 1;
  while (happyNumbersArr.length < 10) {
    console.log(`Checking number ${counter}`);
    let count = 100;
    let sum = counter;
    while (count > 0) {
      sum = findIfHappy(sum.toString());
      if(sum === 1 && !happyNumbersArr.includes(+counter)) {
        console.log(`Found happy number ${counter}`);
        happyNumbersArr.push(+counter);
      }
      count--;
    }
    counter++;
  }
  return happyNumbersArr;
}

const findIfHappy = (numAsStr) => {
  //Split numer into digits
  const digits = numAsStr.split('');
  //Map digits to the squares
  //+x is shorthand for parseInt(x)
  const asNums = digits.map(x => +x);
  //Sum the squares to get a single result
  return asNums.map(x => x*x).reduce((acc, num) => acc + num, 0);
}

//Call and return result
console.log(`First 10 happy numbers = ${happyNumbers(10)}`);
