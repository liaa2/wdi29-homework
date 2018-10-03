// Anagram Detector
console.log("Anagram Detector");
console.log("--------");
// Write a program that, given a word and a list of possible anagrams, selects the anagrams of the given word.
// In other words, given: "listen" and ["enlists" "google" "inlets" "banana"] the program should return "inlets".

const anagramSolver = {
  checkIfAnagram: function (word1, word2) {
    let word1Arr = word1.split("").sort();
    let word2Arr = word2.split("").sort();
    return (word1Arr.toString() === word2Arr.toString());
  },
  testForAnagrams: function (word, possibleAnagrams) {
    let anagrams = [];
    for (let i=0; i<possibleAnagrams.length; i+=1) {
      const isAnag = this.checkIfAnagram(word, possibleAnagrams[i]);
      if (isAnag) {
        anagrams.push(possibleAnagrams[i]);
      }
    }
    return anagrams;
  },
  logTest: function (word, possibleAnagrams) {
    console.log(`Solving for the word "${word}" with possible anagrams: ${possibleAnagrams.join(", ")}`);
    const anagrams = this.testForAnagrams(word, possibleAnagrams);
    console.log(`Anagrams are: ${anagrams.join(", ")}`);
  }
}

// Suggestions
// Start out by getting this working with discrete functions.
// If you feel comfortable with that, try to put all your functions, collections, etc, into an object.

//Test
anagramSolver.logTest("listen", ["enlists", "google", "inlets", "banana"]);
anagramSolver.logTest("post", ["tea", "pots", "spot", "stop", "tops", "toast"]);
