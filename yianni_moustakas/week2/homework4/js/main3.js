console.log("JS Loaded!");

let screenHeight = window.innerHeight;


//This kitty will walk Up and Down
let $kitty2 = $(".kitty2");



//Up to Down
const catWalkDown = function() {
  $kitty2.css("transform", "Rotate(90deg)")
  const startPosition = parseInt($kitty2.css("top"));
  let endPosition = startPosition + 20;
  $kitty2.css("top", endPosition + 'px');
  if (startPosition > window.innerHeight-250){
    $kitty2.css("transform", "Rotate(270deg)");
    // $kitty2.css("left", parseInt(window.innerWidth-249));
    clearInterval(id);
    id = window.setInterval(catWalkUp, 10);
  }
};
let id = window.setInterval(catWalkDown, 10);

//Down to Up
const catWalkUp = function() {
  // $kitty2.css("transform", "ScaleX(-1)");
  const startPosition = parseInt($kitty2.css("top"));
  let endPosition = startPosition - 20;
  $kitty2.css("top", endPosition + 'px');
  if (startPosition < parseInt(0)){
    $kitty2.css("transform", "Rotate (270deg)");
    clearInterval(id);
    id = window.setInterval(catWalkDown, 10);
  }
};


// let screenwidth = document.body.querySelector("body").clientwidth;
let screenWidth = window.innerWidth;


//This kitty will walk left to right
let $kitty = $(".kitty1");



// leftToRight
const catWalkRight = function() {
  const startPosition = parseInt($kitty.css("left"));
  let endPosition = startPosition + 5;
  $kitty.css("left", endPosition + 'px');
  if (startPosition > window.innerWidth-250){
    $kitty.css("transform", "ScaleX(-1)");
    // $kitty.css("left", parseInt(window.innerWidth-249));
    clearInterval(id);
    id2 = window.setInterval(catWalkLeft, 10);
  }
};
let id2 = window.setInterval(catWalkRight, 10);

//rightToLeft
const catWalkLeft = function() {
  $kitty.css("transform", "ScaleX(-1)");
  const startPosition = parseInt($kitty.css("left"));
  let endPosition = startPosition - 5;
  $kitty.css("left", endPosition + 'px');
  if (startPosition < parseInt(0)){
    $kitty.css("transform", "ScaleX(1)");
    clearInterval(id);
    id2 = window.setInterval(catWalkRight, 10);
  }
};


var rocket = document.getElementById('rocket');
rocket.style.position = 'relative';
rocket.style.top = '30px';
rocket.style.left = '10px';


var rocketLaunch = window.setInterval(function() {
  var originalPositionRocket = parseInt(rocket.style.top);
  var newPositionRocket = originalPositionRocket - 30;
  rocket.style.top = newPositionRocket + 'px';
}, 100);

clicked = true;
  $("button").click(function(){
      if(clicked){
          $("body").css('background-color', 'red');
          clicked  = false;
      } else{
          $("body").css('background-color', 'blue');
          clicked  = true;
      }
  });

//UNCOMMENT THIS;
let playMusic = document.createElement('audio');

//Make a music autoplay thing

// playMusic.setAttribute('controls', "");
playMusic.setAttribute('autoplay', "");
playMusic.style = 'position:absolute; top:55%; left:10%;';
let musicSource = document.createElement('source');
musicSource.setAttribute('src', 'music/1999.m4a');
musicSource.setAttribute('type', 'audio/mpeg');
playMusic.appendChild(musicSource);
document.body.appendChild(playMusic);



//Autoplay if chrome settings not set to allow autoplay
// function playAudio() {
//     playMusic.play();
// }
//
// playAudio();
