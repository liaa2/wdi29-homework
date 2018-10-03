// The Cat Walk
// Who needs Milan when you have JavaScript?
// Start with this webpage, which has a single img tag of an animated GIF of a cat walking.
// Create a new Javascript file and link to it with a script tag at the bottom.// Create a variable to store a reference to the img.// Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.// Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
// Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!
// Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.
// Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.
// Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.
// Bonus #4: Pretty much go nuts or whatever.

// NO JQUERY
// const cat = document.querySelector('img');
//
// cat.style.left = '0px';
// cat.style.webkitTransform = 'scaleX(-1)';
// cat.style.transform = 'scaleX(-1)';
//
//
// const animateLeft = function(){
//   cat.style.webkitTransform = 'scaleX(1)';
//   cat.style.transform = 'scaleX(1)';
//   let boundary = window.innerWidth - cat.width;
//   const pos = parseInt(cat.style.left);
//   // console.log('Left Position:', pos);
//   // console.log('Left Boundary:', boundary);
//   if(pos > boundary){
//     clearInterval(id);
//     id =  setInterval(animateRight, 50);
//   } else {
//     cat.style.left = pos + 10 + 'px';
//   }
// };
//
// const animateRight = function(){
//   cat.style.webkitTransform = 'scaleX(-1)';
//   cat.style.transform = 'scaleX(-1)';
//   const pos = parseInt(cat.style.left);
//   // console.log('Right Position:', pos);
//   if(pos <= 0){
//     clearInterval(id);
//     id = setInterval(animateLeft, 50);
//   } else {
//     cat.style.left = pos - 10 + 'px';
//   }
// };
//
// let id = setInterval(animateLeft, 50);
// window.onload = boundary;


// JQUERY
const $cat = $('img');
$cat.css({left:'0px', width: '300px'});

const animateRight = function(){
  $cat.css({webkitTransform:'scaleX(1)', transform:'scaleX(1)'});

  let boundary = window.innerWidth - parseInt($cat.css('width'));
  const pos = parseInt($cat.css('left'));

  if(pos >= boundary){
    clearInterval(id);
    id =  setInterval(animateLeft, 50);
  } else {
    $cat.css('left', `${pos + 10}px`);
}
};

const animateLeft = function(){
  $cat.css({webkitTransform:'scaleX(-1)', transform:'scaleX(-1)'});

  const pos = parseInt($cat.css('left'));

  if(pos <= 0){
    clearInterval(id);
    id = setInterval(animateRight, 50);
  } else {
    $cat.css('left', `${pos - 10}px`);
  }
};

let id = setInterval(animateRight, 50);
window.onload = boundary;
