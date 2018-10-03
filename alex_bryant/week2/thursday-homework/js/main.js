// Exercises: Animation
// The Cat Walk
// Who needs Milan when you have JavaScript?

// Start with this webpage, which has a single img tag of an animated GIF of a cat walking.
//
// <!DOCTYPE html>
// <html>
//  <head>
//   <meta charset="utf-8" />
//   <title>Cat Walk</title>
//  </head>
//  <body>
//
//   <img style="position:absolute;" src="http://www.anniemation.com/clip_art/images/cat-walk.gif">
//
//  </body>
// </html>
// Create a new Javascript file and link to it with a script tag at the bottom.
//
// Create a variable to store a reference to the img.

const $catImg = $("img");

// Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.

$catImg.css("left","0px");

// Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.

const getCurrentPos = function () {
  return parseInt($catImg.css("left"));
}

const catWalk = function (dist) {
  $catImg.css("left",`${getCurrentPos() + dist}px`);
};

// Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!

// Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.

// window.setInterval(function() {
//   if (getCurrentPos() > window.innerWidth) {
//     catImg.style.left = `${-catImg.width}px`;
//   }
//   catWalk(10);
// }, 50);

// Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.

// Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.

let max;
const setMax = function() {
  max =  window.innerWidth - parseInt($catImg.css("width"));
}
let trip = 0;
// onload allows the image to load so the width can be acquired
window.onload = setMax;
const dancingCatGif = "https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/7/7d/Dancing-cat.gif";
const regularCatGif ="http://www.anniemation.com/clip_art/images/cat-walk.gif";

const catFlipper = function () {
  //Flip cat at ends of the screen
  if (trip % 2 === 0) {
    $catImg.attr("class", "regular";
    catWalk(10);
    if (getCurrentPos() > max) {
      $catImg.attr("class", "flipped";
      trip++;
    }
  } else {
    $catImg.attr("class", "flipped";
    catWalk(-10);
    if (getCurrentPos() <= 0) {
      $catImg.attr("class", "regular";
      trip++;
    }
  }
}

const catDance = function() {
  let count = 0;
  const dance = window.setInterval(function() {
    count++;
    if(count > 2) {
      window.clearInterval(dance);
      catFlipper();
      $catImg.attr("src", regularCatGif;
      interval = window.setInterval(catNormalWalk, 50);
    }
  }, 1000);

};

const catNormalWalk = function() {

  if (getCurrentPos() === Math.floor((max/2) / 10) * 10) {
    window.clearInterval(interval);
    $catImg.attr("src", dancingCatGif);
    catDance();
  }

  catFlipper();

};

let interval = window.setInterval(catNormalWalk, 10);

// Bonus #4: Pretty much go nuts or whatever.
