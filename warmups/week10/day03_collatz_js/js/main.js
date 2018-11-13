const collatz = (num) => {
  // This collection will be where we store each value for comparison. With each iteration we will add the new value to the end and target that value with `collection[ collection.length - 1 ]`.
  let collection = [num];

  const makeCollection = () => {
    // while(the current number i.e. 12, 6, 3 etc, is > 1)
    // checking that the last number in the array is larger than 1
    while (collection[collection.length -1] > 1) {

      // store the number from the last iteration
      // when collection = [12, 6], currentNum = 6
      const currentNum = collection[collection.length -1];

      // This ternary will do two things for us, it will evaluate if the number give is odd or even then run the corresponding code.
      const nextNum = currentNum % 2 === 0? ( currentNum/2 ): (currentNum * 3 +1 );
      collection.push(nextNum);
      console.log(collection);
    }
  } // makeCollection

  const answer = () => {
    console.log(`The function ran ${collection.length - 1} times.`);
    console.log(`The process was: ${collection.join(", ")}`);
  }

  // call both functions otherwise nothing will happen.
  makeCollection();
  answer();

  // we have the ability to return an output for a user through the console logs but what about return the data in a format that another programmer might like to use?
  return {
  return {
    start: num,
    collection,
    steps: collection.length -1
  }
}; // collatz


console.log(collatz(12));



//Alex S solution:
// const collatzNum = (number) => {
//   let steps = [number]
//   do {
//     if (number % 2 ==0) {
//       number = number/2
//     }else {
//       number = 3*number + 1
//     }
//     steps.push(number)
//   } while (number !== 1);
//   console.log("Steps are \n", steps, " Number of steps is: ", steps.length-1);
// }

// console.log(collatzNum(12));
