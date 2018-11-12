const isHappy = function(num){
  let cycle = {};
  let squareSum = num;
  let count = 0;

  while(true){
    squareSum = sumOfDigitsSquared(squareSum); //return 1 or not 1
    console.log("==================================================");

    console.log('squareSum', squareSum);
    if (squareSum === 1) {
      //found a happy number
      return true;
    }
    console.log('cycle[squareSum]', cycle[squareSum]);
    if (cycle[squareSum] === true) {
       // detected a repeating pattern, i.e. not a happy number
      return false;
    }

    cycle[squareSum] = true;
    count ++;
    console.log("cycle: ", cycle);
  }
};

const sumOfDigitsSquared = function(num){
  let sum = 0;
  let numStr = num.toString();

  for( let i = 0; i < numStr.length; i++ ){
    sum += +numStr[i] * +numStr[i];
  }

  // Here's an even fancier way to get the individual digits of the number without converting it
  // to a sting first, by using modulus
  // let digit;
  // while (num > 0) {
  //   digit = num % 10 ;
  //   sum += digit * digit ;
  //   num = (num  - digit) / 10 ;
  // }

  return sum;
}

const generateHappyNumbers = function(count){
  let found = 0;

  for( let i = 0; found < count; i++ ){

    if (isHappy(i)) {
      found ++;
      console.log('Found happy number #%d: %d', found, i);
    }
  }
}
