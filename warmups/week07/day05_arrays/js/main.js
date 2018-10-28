const testOne = ['one', 'two', 'three'];

const reverse = array => {
  let reversed = [];

  // for( let i = 0; i < array.length; i++ ){
  //   reversed.unshift(array[i])
  // }

  // OR
  for( let i = array.length - 1; i >= 0; i-- ){
    reversed.push(array[i]);
  }

  // console.log(reversed);
  return reversed;
}

const testTwo = ['one', 'two',['a', 'b', 'c'], 'three'];


const flatten = array => {
  let flattened = [];

  for( let i = 0; i < array.length; i++ ){
    let currentElem = array[i];
    // console.log(currentElem);

    // if (currentElem instanceof Array) {
    // or
    if (currentElem.constructor === Array) {
      for( let j = 0; j < currentElem.length; j++ ){
        // console.log(currentElem[j]);
        flattened.push(currentElem[j]);
      }
    } else {
      flattened.push(currentElem);
    }
  } //for

  return flattened;
}


// Alex Scriven's solution

// const flatten = function(array){
//   array = array +""
//   array = array.split(",")
//   console.log(array);
// };
//
// flatten(["Hello", ["World", 42] ]);
// flatten(["Hello", [[["World,lalala, hahaha"]]]]);
