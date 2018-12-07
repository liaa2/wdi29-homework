// Anagram Detector
// Write a program that, given a word and a list of possible anagrams, selects the anagrams of the given word.
//
// In other words, given: "listen" and ["enlists" "google" "inlets" "banana"] the program should return "inlets".
//
// Suggestions
// Start out by getting this working with discrete functions.
// If you feel comfortable with that, try to put all your functions, collections, etc, into an object.

/*
Approach
  Create an object that will hold the logic
  Within the object, create a method that will convert the word into a list of alphabeticised letters
  Create another method which calls the first method and compares the input word against the array of potential matches
*/


//version 1
let anagrams = [];

const customSort = function(word){
  // word = word.split("").sort().join("");
  // return word;

  return word.split("").sort().join("");
}

const checkForAnagram = function(word, candidateWords){
  // word = word.split("");
  // console.log(word);
  // word = word.sort();
  // console.log(word);
  // word = word.join("");
  // console.log(word);

  //shorter way
  word = customSort(word);
  // console.log(word);

  for (var i = 0; i < candidateWords.length; i++) {
    // console.log(candidateWords[i]);
    let candidate = customSort(candidateWords[i]);
    // console.log(candidate);

    if (word === candidate) {
      anagrams.push(candidateWords[i])
    }
  }//for

  console.log(`The anagram of ${word} is ${anagrams}.`);
};

checkForAnagram("listen", ["enlists", "google", "inlets", "banana"]);




// version 2
const anagramChecker = {
  // empty array that will store the results
  anagrams: [],

  // method that takes the word as an argument and converts the word into a list of alphabeticised letters
  customSort: function(word){
    /*
    split('') - will convert the string into an array ['l', 'i', 's', 't', 'e', 'n']
    sort() - will sort the array alphabetically
    join('') - convert the array back to a string
    */
    // word = word.split("").sort().join("");
    // return word;

    return word.split("").sort().join("");
  },

  // second method that will call customSort() and compare the input word against the array of potential matches
  checkForAnagram: function(word, candidateWords){
    // word = word.split("");
    // console.log(word);
    // word = word.sort();
    // console.log(word);
    // word = word.join("");
    // console.log(word);

    //shorter way
    // store into a variable the word that was returned by the customSort() method
    word = this.customSort(word);
    // console.log(word);

    for (var i = 0; i < candidateWords.length; i++) {
      // console.log(candidateWords[i]);
      let candidate = this.customSort(candidateWords[i]);
      // console.log(candidate);

      if (word === candidate) {
        this.anagrams.push(candidateWords[i])
      }
    }//for

    console.log(`The anagram of ${word} is ${this.anagrams}.`);
  } // checkForAnagram
}; // anagramChecker


anagramChecker.checkForAnagram("listen", ["enlists", "google", "inlets", "banana"]);
