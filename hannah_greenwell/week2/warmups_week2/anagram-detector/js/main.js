console.log("JS loaded!");

// Anagram Detector
// Write a program that, given a word and a list of possible anagrams, selects the anagrams of the given word.
//
// In other words, given: "listen" and ["enlists" "google" "inlets" "banana"] the program should return "inlets".
//
// Suggestions
// Start out by getting this working with discrete functions.
// If you feel comfortable with that, try to put all your functions, collections, etc, into an object

// const findAnagrams = function(word, possibleAnagrams){
//
//   let actualAnagrams = [];
//
//   for(let i = 0; i < possibleAnagrams.length; i++){
//     const currentWord = possibleAnagrams[i];
//     //console.log(possibleAnagrams[i]);
//
//     if(word.length === currentWord.length){
//
//       for(let j = 0; j < word.length; j++){
//         const currentLetter = currentWord[j];
//         // console.log(currentLetter);
//
//         if(word.includes(currentLetter)){
//           word = word.replace(currentLetter, '_');
//         } else {
//           break;
//         }
//       } // inner for
//       actualAnagrams.push(currentWord);
//     } // outer if
//
//   } // outer for
//   console.log(actualAnagrams.join(', '));
// };


// ANSWER
const anagramDetector = {
  anagrams: [],

  customSort: function(word){
    return word.split("").sort().join("");
  },

  checkForAnagram: function(word, candidateWords){
    // word = word.split("");
    // word = word.sort();
    // word = word.join("");
    sortedWord = this.customSort(word);

    for(let i = 0; i < candidateWords.length; i++){
      let candidate = this.customSort(candidateWords[i]);

      if(sortedWord === candidate){
        this.anagrams.push(candidateWords[i]);
      }
    }
    console.log(`The anagrams of ${word} is ${this.anagrams}.`);
  },
};
