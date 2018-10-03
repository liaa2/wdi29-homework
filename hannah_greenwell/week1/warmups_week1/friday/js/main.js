console.log("JS loaded!");

// Leap Year Warmup Exercise
// Do this in HTML and JS!
//
// Write a function that will take any given year and return whether it is a leap year or not. Remember that a leap year is:
//
// Every year that is evenly divisible by 4
// Except if it is evenly divisible by 100...
// Unless it is also divisible by 400
// Test Data... Make sure it is working!
//
// 1997 is not a leap year, it should return false
// 1996 is a leap year, it should return true
// 1900 is not a leap year, it should return false
// 2000 is a leap year, it should return true
// How to structure it...
//
// We want a custom function called isLeapYear
// Bonus!
//
// Ask the user what number they want to test
// Watch a whole heap of information about leap years... http://www.youtube.com/watch?v=xX96xng7sAE

// const isLeapYear = function(year){
//   if(year % 4 === 0 ){
//
//     if(year % 100 === 0){
//
//       if(year % 400 === 0){
//         return true;
//       }
//
//       return false;
//
//     }
//
//     return true;
//
//   } else {
//
//     return false;
//   }
// }; // function

const isDivisibleBy = function(num, divisor){
    if(num % divisor === 0){
      return true;
    } else {
      return false;
    }
};

const isLeapYear = function(year){
  if( year % 4 === 0 && !(year % 100 === 0 && year % 400 !== 0) ){
    return true;
  } else {
    return false;
  }
}; // function


const year = prompt("Please enter a year.");
console.log(isLeapYear(year));

// console.log(isLeapYear(1997));
// console.log(isLeapYear(1996));
// console.log(isLeapYear(1900));
// console.log(isLeapYear(2000));
// console.log(isLeapYear(4));
