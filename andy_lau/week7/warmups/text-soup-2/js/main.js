

$(document).ready(function(){

  let counter = 0;

  const controller = {
    fadeInSpeed: 1000,
    fadeOutSpeed: 2000,
    fontSizeRange: 80,
    timerInterval: 100,
    textColor: '#95250d',
    addWord: "",
  }

  const gui = new dat.GUI();
  gui.add(controller, "fadeInSpeed", 1, 2000);
  gui.add(controller, "fadeOutSpeed", 1, 3000);
  gui.add(controller, "fontSizeRange", 1, 300);

  const timerController = gui.add(controller, "timerInterval", 1, 1000);

  timerController.onFinishChange(function(value){
    clearInterval(timer);
    timer = setInterval(putWord, value);
  })

  gui.add(controller, "textColor")

  // This single line grabs the text contents of our div and returns it as one big string (the .html()
  // jQuery method would grab any child HTML it contained too), then turns it into an array by splitting
  // the string up based on a regular expression which looks for spaces, punctuation and newlines.
  // (That punctuation will not appear in the words that fill our new array.)
  // So, note that .split() will accept a regular expression as well as just a string...
  const words = $("#words").text().split(/[ ,."';\n\-]+/);

  // store the body in a variable to use later when appending
  const $body = $("body");

  // helper function to return a number between 0 and max
  const random = function(max){
    return Math.floor(Math.random() * max);
  }

  // Our main function to randomly put a word on the page
  const putWord = function(){
    // Get a random word from our array, using our random helper funcion, with the word array length as the maximum value
    const randomIndex = random(words.length);
    // select random word
    const text = words[randomIndex];
    // console.log(text);

    // Insert the random word as the content of a new div
    const $div = $("<div class='word'>").html(text);

    $div.css({
      top: random(window.innerHeight) + "px",
      left: random(window.innerWidth) + "px",
      fontSize: (40 + random(controller.fontSizeRange)) + "px",
      color: controller.textColor,
      transform: `rotate(${random(360)}deg)`
    });

    // apppend the new $div to the body
    $div.appendTo($body);

    // make the text fade in and fade out of the screen
    $div.fadeIn(controller.fadeInSpeed).fadeOut(controller.fadeOutSpeed, function(){
      $(this).remove();
    });

    counter += 1

  };
  // putWord();
  setInterval(putWord, controller.timerInterval);

});
//
// Text Soup 2: the Widgeting
// Using the solution for the original text soup, and the dat.gui Javascript library, add controller elements to the Text Soup page to allow real-time control of the following parameters from within the browser:
//
// fade in time (i.e. a range from 1 to 5000 milliseconds)
// fade out time
// font size
// BONUS:
// add a controller to change the add word interval (consider example#7 from the page above, and this example)
// add a controller to change the text colour using the colour controller (example#4)
// add a text field controller, and use the word(s) from the text field in between every other random word that is added
// add a button controller which clears all words off the screen when pressed
// HINTS:
// To make sure you have the up-to-date Text Soup warmup solution in your fork of the homework repo, and to copy it to a new folder to work on, run these commands in iTerm (BUT MAKE SURE YOU'RE UPDATING THE FILE NAMES APPROPRIATELY):
// cd ~/wdi/homework
// git pull upstream master
// cp -r warmups/week07/day01_textsoup ~/{your-path-to-the-warmup}/textsoup2
// cd ~/{your-path-to-the-warmup}/textsoup2
// curl https://raw.githubusercontent.com/dataarts/dat.gui/master/build/dat.gui.js >js/dat.gui.js
// atom .
// Now you have a copy of the Text Soup warmup in a new folder in your Projects folder (assuming you already have a ~/Projects folder. We're making this copy so you don't work directly on my warmup solution code in the homework repo, which would cause a merge conflict next time you commit.
//
// Also, you're getting the dat.gui.js file!
//
// It's probably best not to use the constructor-style example in the dat.gui page I linked to. It will be simpler to just use an object to store your controller variables, like so:
// var controllers = {
//   fadeInSpeed: 100,
//   // etc..
// };
//
// var gui = new dat.GUI();
// gui.add(controllers, 'fadeInSpeed', // etc...
