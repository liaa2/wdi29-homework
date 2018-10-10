



const $cat = $('img.cat');

$cat.css('left', '0px');

const rightEdge = window.innerWidth - $cat.width();
let catStepAmount = 5;

const catWalk = function(){
  //get current position of cat as a Number
  let leftPos = parseInt($cat.css('left'));
  leftPos += catStepAmount;
  $cat.css('left', `${leftPos}px`);

  //Is the cat's position greater than RHS of the screen

  if ((leftPos > rightEdge) || (leftPos < 0)) {
    catStepAmount *= -1;
    $cat.css('transform', `scaleX(${Math.sign(catStepAmount)})`)
  } //trick to flip image back
}

setInterval(catWalk, 30);
