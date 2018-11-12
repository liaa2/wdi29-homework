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

















































// const isHappy = function(num){
//   let cycle = {};
//   let squareSum = num;
//   let count = 0;
//
//   while(true){
//
//     squareSum = sumOfDigitsSquared( squareSum );
//
//     console.log('squareSum', squareSum);
//     if ( squareSum === 1 ) {
//       return true;
//     }
//
//     console.log('cycle[squareSum]', cycle);
//     if (cycle[squareSum] === true) {
//      return false;
//     }
//
//     cycle[ squareSum ] = true;
//     count ++;
//     console.log(cycle);
//   }
// }
//
// const sumOfDigitsSquared = function( num ){
//   let sum = 0;
//   let numStr = num.toString();
//
//   for( let i = 0; i < numStr.length; i++ ){
//     sum += +numStr[i] * +numStr[i]
//   }
//   return sum;
// }
//
// const generateHappyNumbers = function(count){
//   let found = 0;
//
//   console.log(count);
//   for( let i = 0; found < count; i++ ){
//     if (isHappy(i)) {
//       found ++;
//       console.log('found happy number', i);
//     }
//   }
// }



















// const isHappy = function(num){
//
//   let cycle = {};
//
//   let squareSum = num;
//
//   let count = 0;
//
//   while(true){
//
//     squareSum = sumOfDigitsSquared( squareSum )
//
//     if( squareSum === 1 ){
//       return true;
//     }
//
//     if( cycle[ squareSum ] === true ){
//       return false
//     }
//
//     cycle[ squareSum ] = true
//     count++
//     // console.log(cycle);
//   }
// }// isHappy
//
// const sumOfDigitsSquared = function(num){
//
//   // let numStr = num.toString();
//   let sum = 0;
//
//   // for( let i = 0; i < numStr.length; i++ ){
//   //   sum += +numStr[i] * +numStr[i]
//   //   // sum += pareseInt(numStr[i]) * pareseInt(numStr[i])
//   // }
//
//   //or
//   let digit
//   while( num > 0){
//     digit = num % 10
//     sum += digit * digit
//     num = (num - digit) / 10
//   }
//
//   // console.log(sum);
//   return sum;
// }
//
// const generateHappyNumbers = function(count){
//
//   let found = 0;
//
//   for( let i = 0; found < count; i++ ){
//     if( isHappy(i) ){
//       found++;
//       console.log('Found happy number', i);
//     }
//   };
//
//   // console.log(found);
//
// }// generateHappyNumbers
//
// generateHappyNumbers( 10 );


// there is the string substitution patterns that are built into console.log() or console.debug().
//
// The pattern goes as I have presented below:
//
// %s for a String value
//
// %d or %i for a Integer value
//
// %f for a Floating point number
//
// %o for an Object hyperlink
//
// So essentially you are replacing the values with the values supplied
