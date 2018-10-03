// Anagram Detector
// Write a program that, given a word and a list of possible anagrams, selects the anagrams of the given word.
//
// In other words, given: "listen" and ["enlists" "google" "inlets" "banana"] the program should return "inlets".
//
// Suggestions
// Start out by getting this working with discrete functions.
// If you feel comfortable with that, try to put all your functions, collections, etc, into an object.

const word = 'listen';
const otherWords = ["enlists", "google", "inlets", "banana", "enlist"];
let anagrams = [];

const compare = function( word1 , inputWords){
  const orderedWord = word1.split("").sort().join("");
  for (let i = 0; i < inputWords.length; i ++){
    let currentWord = (orderLetters(inputWords[i]));
    if( currentWord === orderedWord){
      anagrams.push(inputWords[i]);
    }
  }
}

const orderLetters = function(input){
  return input.split("").sort().join("");
}

compare(word, otherWords);
console.log(anagrams);
