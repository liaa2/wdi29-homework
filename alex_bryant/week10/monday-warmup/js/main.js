// Prime Factors
// A prime number is any number greater than one that is only divisible by itself.
//
// 1 is not a prime number (it is not greater than 1).
// 2 is a prime number (it is greater than one and is only evenly divisible by itself and 1).
// 3 is a prime number (as above).
// 4 is not a prime number (it is evenly divisible by 2).
// The prime factors of an integer are the set of prime numbers that will divide the integer exactly.
//
// Example
// What are the prime factors of 60?
//
// 1 is not a prime number.
// 2 is a prime number. 60 is evenly divisible by 2 (therefore 2 is a prime factor of 60), and leaves 30.
// 30 is evenly divisible by 2 (therefore 2 is a prime factor of 60), and leaves 15.
// 15 is not evenly divisible by 2.
// 3 is the next prime number. 15 is evenly divisible by 3 (therefore 3 is a prime factor of 60), and leaves 5.
// 4 is not a prime number.
// 5 is a prime number. 5 is evenly divisible by 5 (therefore 5 is a prime factor of 60), and leaves 1.
// When we get to 1, we're done.
// The prime factors of 60 are 2, 2, 3, 5
// You can check this yourself:
//
// 2 * 2 * 3 * 5
// = 4 * 15
// = 60
// Success!
// YOUR TASK
// Write a function in Javascript which takes a number as its argument and returns an array containing the prime factors of that number.

// Takes an input of an integer and returns all of the
// prime factors of that number as an array
const primeFactors = integer => {
  console.log('Input', integer);
  const primeFactors = [];
  for (let i=2; i<=integer; i+=1) {
    console.log('Test number', i);
    while (isDivisibleByInt(i, integer)[0]) {
      primeFactors.push(i);
      integer = isDivisibleByInt(i, integer)[1];
      console.log('Integer becomes', integer);
    }
    if (integer === 1) break;
  }
  return primeFactors;
}

// Checks if number is evenly divisible by integer and returns
// array of [true/false, resulting_number]
const isDivisibleByInt = (input, integer) => {
  if(isPrime(input) && integer % input === 0)
    return [true, integer / input];
  return [false, null];
}

// Checks if number is prime and returns true/false
const isPrime = num => {
  for(let i=2; i<num; i+=1)
    if(num % i === 0) return false;
  return num !== 1 && num !== 0;
}

// Test functions
console.log('Prime Factors', primeFactors(60));
console.log('Prime Factors', primeFactors(1200));
