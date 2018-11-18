// The Collatz conjecture
console.log("The Collatz conjecture");
console.log("=========================================");
// The Collatz conjecture is a conjecture in mathematics named after Lothar Collatz, who first proposed it in 1937. It's also known as the 3n + 1 conjecture, the Ulam conjecture, the Kakutani's problem, the Thwaites conjecture, Hasse's problem or the Syracuse problem, the sequence of numbers that results is referred to as the hailstone numbers or the wondrous numbers.
//
// The problem is defined as follows:
//
// Take any positive integer n. If n is even, divide it by 2 to get n / 2.
// If n is odd, multiply it by 3 and add 1 to obtain 3n + 1.
// Repeat the process indefinitely.
// The conjecture is that no matter what number you start with, you will always eventually reach 1.
//
// Task
// Write a program that given a number, verifies this conjecture for all positive numbers greater than one. Ideally your program will output when it has completed, how many cycles it ran for and all the steps it took to reach the end.
//
// For instance, starting with n = 12, one gets the sequence 12, 6, 3, 10, 5, 16, 8, 4, 2, 1.
// n = 19, for example, takes longer to reach 1: 19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1.

let bufferedNums = [];
const collatzConjecture = n => {
  bufferedNums.push(n);
  let result = n;
  if(n % 2 === 0) {
    result = n/2;
  } else {
    result = n * 3 + 1;
  }
  if (result === 1) {
    bufferedNums.push(result);
    return;
  }
  collatzConjecture(result);
}

//Testing for basic examples
console.log("Testing for basic examples");
console.log("=========================================");
collatzConjecture(12);
console.log(`For 12 --> ${bufferedNums.join(', ')}`);
bufferedNums = [];
collatzConjecture(19);
console.log(`For 19 --> ${bufferedNums.join(', ')}`);
bufferedNums = [];

//Testing All numbers up to a certain value
console.log("Testing all numbers up to a max");
console.log("=========================================");
let startTime, endTime;
const start = () => {
  startTime = new Date();
};
const end = () => {
  endTime = new Date();
  let timeDiff = endTime - startTime; //in ms
  // strip the ms
  timeDiff /= 1000;

  // get seconds
  const seconds = Math.round(timeDiff);
  console.log(`Time take to calculate = ${seconds} seconds`);
}
const testUpToMax = max => {
  console.log(`Testing up to ${max}`);
  start();
  for (let i=1; i<=max; i+=1) {
    collatzConjecture(i);
    bufferedNums = [];
  }
  end();
  return `All ${max} resulted in 1`;
}
console.log(`For all combos up to 1000000 --> ${testUpToMax(1000000)}`);
console.log(`For all combos up to 1000000000 --> ${testUpToMax(1000000000)}`);
