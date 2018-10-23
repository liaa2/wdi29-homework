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




// helper function to return a number between 0 and max
const random = function(max){
  return Math.floor(Math.random() * max);
}

let Controllers = function() {
  this.fadeInSpeed = 1000;
  this.fadeOutSpeed = 3000;
  this.fontSize = 20;
  this.addWordInterval = 100;
  this.textColor = "#ff0000";
  //this.colorRandom = [random(255), random(255), random(255)];
};

$(document).ready(function(){

  let controllers = new Controllers();
  let gui = new dat.GUI();
  gui.add(controllers, 'fadeInSpeed', 100, 10000);
  gui.add(controllers, 'fadeOutSpeed', 100, 10000);
  gui.add(controllers, 'fontSize', 10, 100);
  gui.addColor(controllers, 'textColor');
  let wordIntervalCont = gui.add(controllers, 'addWordInterval', 10, 2000);

  // console.log("jQuery worked");

  // This single line grabs the text contents of our div and returns it as one big string (the .html()
  // jQuery method would grab any child HTML it contained too), then turns it into an array by splitting
  // the string up based on a regular expression which looks for spaces, punctuation and newlines.
  // (That punctuation will not appear in the words that fill our new array.)
  // So, note that .split() will accept a regular expression as well as just a string...
  const words = $("#words").text().split(/[ ,."';\n\-]+/);

  // store the body in a variable to use later when appending
  const $body = $("body");

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
      fontSize: (controllers.fontSize) + "px",
      color: controllers.textColor,
      transform: `rotate(${random(360)}deg)`
    });

    // apppend the new $div to the body
    $div.appendTo($body);

    // make the text fade in and fade out of the screen
    $div.fadeIn(controllers.fadeInSpeed).fadeOut(controllers.fadeOutSpeed, function(){
      $(this).remove();
    });

  };
  // putWord();
  let timer = setInterval(putWord, controllers.addWordInterval);

  wordIntervalCont.onChange(function() {
    clearInterval(timer);
  });

  wordIntervalCont.onFinishChange(function() {
    setInterval(putWord, controllers.addWordInterval);
  });
});
