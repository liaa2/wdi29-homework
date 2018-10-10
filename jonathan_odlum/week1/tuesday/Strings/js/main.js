console.log("Ship-shape, captain!");

// DrEvil
// Create a function called DrEvil. It should take a single argument, an amount, and return ' dollars', except it will add '(pinky)' at the end if the amount is 1 million. For example:
//
//   DrEvil(10): 10 dollars
//   DrEvil(1000000): 1000000 dollars (pinky)

const drEvil = function(amount){
  let dollars = `${amount} dollars`
  if (amount === 1000000){
    dollars = dollars + " (pinky)";
  }
  return dollars;
}

// MixUp
// Create a function called mixUp. It should take in two strings, and return the concatenation of the two strings (separated by a space) slicing out and swapping the first 2 characters of each. You can assume that the strings are at least 2 characters long. For example:
//
//   mixUp('mix', 'pod'): 'pox mid'
//   mixUp('dog', 'dinner'): 'dig donner'
// Look up the JavaScript string reference to find methods which may be useful!

const mixUp = function(string1, string2){
  if (string1.length <= 2 || string2.length <= 2){
    return "TOO SHORT! Words must be 3 or more chars in length."
  }
  else {
    let word1 = string2.slice(0 , 2);
    let word2 = string1.slice(0 , 2);
    word1 = word1 + string1.slice(2 , string1.length);
    word2 = word2 + string2.slice(2 , string2.length);
    return `${word1} ${word2}`;
  }

  //   for (i = 0; i < string1.length; i ++){
  //     if (i < 2)
  //       word1 = word1 + string2[i];
  //     else
  //       word1 = word1 + string1[i];
  //   }
  //   for (i = 0; i < string2.length; i ++){
  //       if (i < 2)
  //         word2 = word2 + string1[i];
  //       else
  //         word2 = word2 + string2[i];
  //   }
  //   return `${word1} ${word2}`;
  // }
}

// FixStart
// Create a function called fixStart. It should take a single argument, a string, and return a version where all occurences of its first character have been replaced with '*', except for the first character itself. You can assume that the string is at least one character long. For example:
//
// fixStart('babble'): 'ba**le'

const fixStart = function(str){
  let fixed  = "";
  let duplicated = false;
  for (i = 0; i < str.length; i ++){
    duplicated = false;
    let currentLetter = str[i];
    for (j = 0; j < i; j ++){
      if (str[j] === currentLetter){
        duplicated = true;
      }
    }
    if (duplicated === false)
      fixed = fixed+str[i];
    else
      fixed = fixed+"*";
  }
  return fixed;
}

// Verbing
// Create a function called verbing. It should take a single argument, a string. If its length is at least 3, it should add 'ing' to its end, unless it already ends in 'ing', in which case it should add 'ly' instead. If the string length is less than 3, it should leave it unchanged. For example:
//
//   verbing('swim'): 'swimming'
//   verbing('swimming'): 'swimmingly'
//   verbing('go'): 'go'

const verbing = function(string){
  if (string.length < 3 || string.substr(-5) === "ingly"){
    return string;
  }
  else if(string.substr(-3) === "ing"){
      return `${string}ly`;
  }
  else{
    return `${string}ing`;
  }
}

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

const notBad = function(str){
  let notIndex = str.indexOf("not");
  let badIndex = str.indexOf("bad");
  let notNotBad = "";
  if (notIndex < badIndex && notIndex !== -1){
    beforeNot = str.slice(0, notIndex);
    afterBad = str.slice(badIndex+3, str.length-1);
    notNotBad = beforeNot + "good" + afterBad;
  }
  else
    notNotBad = str;
  return notNotBad;
}
