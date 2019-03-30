// The Calculator
// Part 1
// Write a function called squareNumber that will take one argument (a number), square that number, and return the result. It should also log a string like "The result of squaring the number 3 is 9."

const squareNumber = function (num) {
  let result = num**2;
  return `The result of squaring the number ${num} is ${result}`;
};
console.log(squareNumber(16));

// Write a function called halfNumber that will take one argument (a number), divide it by 2, and return the result. It should also log a string like "Half of 5 is 2.5.".

const halfNumber = function (num){
  let result = num/2;
  return `Half of ${num} is ${result}`;
};
console.log(halfNumber(13));

// Write a function called percentOf that will take two numbers, figure out what percent the first number represents of the second number, and return the result. It should also log a string like "2 is 50% of 4."

const percentOf = function (num1, num2){
  let result = (num1 / num2)*100;
  return `${num1} is ${result}% of ${num2}`;
}
console.log(percentOf(24, 16));

// Write a function called areaOfCircle that will take one argument (the radius), calculate the area based on that, and return the result. It should also log a string like "The area for a circle with radius 2 is 12.566370614359172."
// Bonus: Round the result so there are only two digits after the decimal.

const areaOfCircle = function(radius) {
  let result = Math.PI*radius**2;
  return `The area for a circle with radius of ${radius} is ${result.toFixed(2)}`;
}
console.log(areaOfCircle(9));

// Part 2
// Write a function that will take one argument (a number) and perform the following operations, using the functions you wrote earlier1:
//
// Take half of the number and store the result.
// Square the result of #1 and store that result.
// Calculate the area of a circle with the result of #2 as the radius.
// Calculate what percentage that area is of the squared result (#3).

const finalFunction = function (variable) {
  let half = variable/2;
  let squared = half**2;
  let circleArea = Math.PI*squared**2
  let percentage = (squared/circleArea)*100;
  return Math.round(percentage);
}
console.log(finalFunction(3));
console.log(finalFunction(4));
console.log(finalFunction(5));

// Strings
// These exercises will test your knowledge of string function and conditionals. For many of them, you will want to consult the JavaScript strings reference to find useful string methods to call.
//
// Some of these are challenging and require extra research or a good memory of the pre-work. Don't despair if you get stuck!
//
// DrEvil
// Create a function called DrEvil. It should take a single argument, an amount, and return ' dollars', except it will add '(pinky)' at the end if the amount is 1 million. For example:
//
//   DrEvil(10): 10 dollars
//   DrEvil(1000000): 1000000 dollars (pinky)

const drEvil = function (amount) {
  if (amount === 1000000) {
    return `${amount} dollars (pinky)`;
  } else {
    return `${amount} dollars`;
  };
};
console.log(drEvil(10));
console.log(drEvil(1000000));

// MixUp
// Create a function called mixUp. It should take in two strings, and return the concatenation of the two strings (separated by a space) slicing out and swapping the first 2 characters of each. You can assume that the strings are at least 2 characters long. For example:
//
//   mixUp('mix', 'pod'): 'pox mid'
//   mixUp('dog', 'dinner'): 'dig donner'
// Look up the JavaScript string reference to find methods which may be useful!

const mixUp = function (str1, str2) {
  return str2[0] + str2[1] + str1.slice(2) + " " + str1[0] + str1[1] + str2.slice(2);
}
console.log(mixUp("Christina", "Yianni"));
console.log(mixUp("recorder", "clarionet"));
console.log(mixUp("mother", "father"));

// FixStart
// Create a function called fixStart. It should take a single argument, a string, and return a version where all occurences of its first character have been replaced with '*', except for the first character itself. You can assume that the string is at least one character long. For example:
//
// fixStart('babble'): 'ba**le'

const fixStart = function(string) {
  let firstChar = string.charAt(0);
  return firstChar + string.slice(1).replace(new RegExp(firstChar, 'g'), '*');
};
console.log(fixStart("ffffffffffff"));
console.log(fixStart("biblical"));
console.log(fixStart("diddly-doodly"));

// Verbing
// Create a function called verbing. It should take a single argument, a string. If its length is at least 3, it should add 'ing' to its end, unless it already ends in 'ing', in which case it should add 'ly' instead. If the string length is less than 3, it should leave it unchanged. For example:
//
//   verbing('swim'): 'swimming'
//   verbing('swimming'): 'swimmingly'
//   verbing('go'): 'go'

const verbing = function(str) {
  if (str.length >= 3) {
    if (str.endsWith("ing")) {
      return str + "ly";
    }; {
    return str + "ing";
  };
  };

  {
    return str;
  };
};
console.log(verbing("finsh"));
console.log(verbing("finishing"));
console.log(verbing("terrifying"));

// Not Bad
// Create a function called notBad that takes a single argument, a string.
//
// It should find the first appearance of the substring 'not' and 'bad'.
// If the 'bad' follows the 'not', then it should replace the whole 'not'...'bad' substring with 'good' and return the result.
// If it doesn't find 'not' and 'bad' in the right sequence (or at all), just return the original sentence.
// For example:
//
//   notBad('This dinner is not that bad!'): 'This dinner is good!'
//   notBad('This movie is not so bad!'): 'This movie is good!'
//   notBad('This dinner is bad!'): 'This dinner is bad!'

// const notBad = function (str) {
//   let not = "not";
//   let bad = "bad";
//   if (str.includes(bad) && str.includes(not)) {
//     if (str.indexOf(bad) > str.indexOf(not)) {
//       return str.splice(0, str.indexOf(not)) + str.replace("not"|"bad", good);
//     };
//   }; {
//     return str;
//   };
// };
// console.log(notBad("This kosher breakfast is not too bad"))
// This was my Attempt

  const notBad = function (str) {
  if (str.includes("bad") && str.includes("not")) {
    if (str.indexOf("bad") > str.indexOf("not")) {
      const notTooBad = str.substring(str.indexOf("not"), str.indexOf("bad") + 3); // +3 is so it doesn't stop at b
      return str.replace (notTooBad, "good");
    } else {
      return str;
    }
  } else {
    return str;
  }
};
console.log(notBad("This kosher breakfast is not really that bad"))
console.log(notBad("This kosher breakfast is bad not"))
// This is Alex's attempt
