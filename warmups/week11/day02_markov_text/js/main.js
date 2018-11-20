// create a page in HTML and Javascript which loads a local text file using AJAX,then from the words of the text builds a Markov table: i.e., an object whose keys are each word in the text, and for each key its value is an array which lists all the words that follow that word.
// 1. Have your page load the contents of a text file into a single variable using AJAX (you will need to run a local server so you can open the file as a URL). This is a quick google search away! _hint_ use a search term involving 'simple http server'
// 2. Separate all the text in the loaded file into an array of words.
// 3. Iterate over the array and add a key to your lookup table for each word, and an empty array as the key's value (if it's not already set as a key); get the word that follows this word and push it onto the array of words for this key (i.e. and words in this array are words which have been found to follow this word in your original text). Repeat.
// 4. Pick a random starting word, and get the next word by randomly picking one of the words in its array of following words (if we've allowed duplicates in this array, words that were found to follow more often will have a higher probability of being picked). Repeat!


let markov = {};
let beginnings = [];

const bookFilename = "../markov.txt";

// Build our Markov chain table by iterating over the given text
const makeMarkov = function(text){
  // split huge string into array of individual words
  const words = text.split(/[ ;\-\n]+/);

  for( let i = 0; i < words.length - 1; i++ ){
    let word = words[i];

      //equivalent to if( typeof markov[word] == 'undefined')
    if (!markov[word]) {
      // The key's value must be initialised, otherwise .push won't work
      markov[word] = [];
    } //if

    // get the word after this word from the array of words
    let nextWord = words[i + 1];
    // add that following word to our array of following words for this word
    markov[word].push(nextWord);

    // keep track of suitable sentence-starting words,
    // by checking that their first letter is uppercase
    if (word.match(/^[A-Z][a-z]/)) {
      beginnings.push(word);
    } //if
  } //for
};

// Helper function to return a random integer between 0 and max
const randy = function(max){
  return Math.floor(Math.random() * max);
}

// Helper function to return a random element from the given array
const choose = function(arr){
  return arr[randy(arr.length)];
}

// Generate a new string from our Markov chain, of the specified length
// We can keep using the same Markov chain lookup we created to generate
// as much new text as we want, and it will all have the same statistical
// relation to the original text
const generate = function(length){

  // Choose a suitable start for our generated text
  let next = choose(beginnings);
  let output = next;

  for( let i = 0; i < length; i++ ){
    // Choose a new word based on the current word
    let word = choose(markov[next]);
    // Append to the string we're building, including a space
    output += " " + word;
     // Set the word to use as the key for the next lookup
    next = word;
  } //for

  return output;
}

$(document).ready(function(){

  // Load our text file over AJAX
  // NOTE: for this to work you will have to run a server on your laptop,
  // i.e. by typing the command 'python -m SimpleHTTPServer' in this folder
  $.ajax(bookFilename)
  .done(function(res){
    console.log(res);

      // When our text is loaded, pass it to our Markov-generating function
    makeMarkov(res);

      // Having constructed our Markov chain lookup table, use it to generate some new text!
    let nextText = generate(60);

    let $el = $('<p>').text(nextText);
    $('#output').append($el);
  })
  .fail(function(err){
      // In case of an AJAX error
    console.log("error: ", err);
  });

    // Listen for keypresses, and generate new text when enter is pressed
  $(document).keypress(function(e){

    // If we want to generate new text only when Enter is pressed, we need to check the keyCode
    // of the kepyress event.
    // If we were just checking for an alphanumeric key, we could do: if( e.key === 'g') or similar
    if (e.keyCode === 13) {
      let nextText = generate(60);

      let $el = $('<p>').text(nextText);
      $('#output').append($el);
    }
  }) // keypress
});
