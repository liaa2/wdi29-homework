console.log("JS Loaded!");

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
    id = window.setInterval(catWalkLeft, 10);
  }
};
let id = window.setInterval(catWalkRight, 10);

//rightToLeft
const catWalkLeft = function() {
  $kitty.css("transform", "ScaleX(-1)");
  const startPosition = parseInt($kitty.css("left"));
  let endPosition = startPosition - 5;
  $kitty.css("left", endPosition + 'px');
  if (startPosition < parseInt(0)){
    $kitty.css("transform", "ScaleX(1)");
    clearInterval(id);
    id = window.setInterval(catWalkRight, 10);
  }
};
