const $cat = $('img.cat');
$cat.css('left', '0px');
const rightEdge = window.innerWidth - $cat.width();
let catStepAmount = 5;
const catWalk = function(){
  let leftPos = parseInt($cat.css('left'));
  leftPos += catStepAmount;
  $cat.css('left', `${leftPos}px`);
  if (leftPos > rightEdge || leftPos < 0){
    catStepAmount *= -1;
    $cat.css('transform', `scaleX(${Math.sign(catStepAmount)})`);
  }
}
setInterval( catWalk, 30);
