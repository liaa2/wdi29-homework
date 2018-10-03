// <!-- # Exercises: Animation
//
// ## The Cat Walk
//
// Who needs Milan when you have JavaScript?
//
// Start with this webpage, which has a single img tag of an animated GIF of a cat walking.
// ```html -->
//
// - Create a new Javascript file and link to it with a script tag at the bottom.
// - Create a variable to store a reference to the img.
// - Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.
// - Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
// - Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!
//
// - Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.
//
// - Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.
//
// - Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.
//
// - Bonus #4: Pretty much go nuts or whatever.
//
// ## [Here is some inspiration](https://gist.github.com/ga-wolf/ae7d0e1df214e45213c5) -->


console.log("JS Loaded!");

// let screenwidth = document.body.querySelector("body").clientwidth;
// let screenWidth = window.innerWidth;
//
//
// //This kitty will walk left to right
// let $kitty = $(".kitty1");
// $kitty.css("top", '10%');
//
// //this kitty will walk right to left
// let $kitty2 = $(".kitty2");
// $kitty2.css("left", parseInt(screenWidth));
// $kitty2.css("top", '50%');
//
// //top
// const catWalkRight = function() {
//   const startPosition = parseInt($kitty.css("left"));
//   let endPosition = startPosition + 5;
//   $kitty.css("left", endPosition + 'px');
//   if (startPosition > window.innerWidth-250){
//     $kitty.css("transform", "ScaleX(-1)");
//     $kitty.css("left", parseInt(window.innerWidth-249));
//   }
//
// };
// window.setInterval(catWalkRight, 10);
//
//
// //bottom
// const catWalkLeft = function() {
//   $kitty2.css("transform", "ScaleX(-1)");
//   const startPosition = parseInt($kitty2.css("left"));
//   let endPosition = startPosition - 5;
//   $kitty2.css("left", endPosition + 'px');
//   if (startPosition < parseInt(0)){
//     $kitty2.css("transform", "ScaleX(1)");
//     $kitty2.css("left", -1);
//   }
//
// };
// window.setInterval(catWalkLeft, 10);


//Luke's example
const $cat = $("img.cat");
$cat.css("left", "0px");
let rightEdge = window.innerWidth - $cat.width();
let catStepAmount = 10;


const hasHitLeftEdge = function(left) {
  return left < 0;
}
const hasHitRightEdge = function(left) {
  return left > rightEdge;
}

const catWalk = function() {
  let leftPos = parseInt($cat.css("left"));
  leftPos += catStepAmount;
  $cat.css("left", `${leftPos}px`);
  if (hasHitRightEdge(leftPos) || hasHitLeftEdge(leftPos)) {
    catStepAmount *= -1;
    $cat.css("transform", `scaleX(${Math.sign(catStepAmount)})`);
  }
};


setInterval(catWalk, 30);
