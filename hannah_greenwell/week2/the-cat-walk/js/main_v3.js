// Answer
const $cat = $('img.cat');

$cat.css('left', '0px');

// $variable.width();
const rightEdge = window.innerWidth - $cat.width();

let catStepAmount = 10;

// Below two functions can be written as the test case of if statement in the catWalk function.
const hasHitRightEdge = function(catLeftPos){
  return catLeftPos > rightEdge;
}

const hasHitLeftEdge = function(catLeftPos){
  return catLeftPos < 0;
}

const catWalk = function(){

  let catLeftPos = parseInt($cat.css('left'));
  catLeftPos += catStepAmount;
  $cat.css('left', `${catLeftPos}px`);

  if( hasHitRightEdge(catLeftPos) || hasHitLeftEdge(catLeftPos) ){
    catStepAmount *= -1;
    $cat.css('transform', `scaleX(${Math.sign(catStepAmount)})`);
  }

};

setInterval(catWalk, 50);
