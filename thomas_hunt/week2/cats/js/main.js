console.log("up and running!");


// const catImg = document.getElementsByTagName('img');
//
// // catImg.src = 'http://www.anniemation.com/clip_art/images/cat-walk.gif';
//
// catImg.style
//
// parseInt(document.querySelector('img').style.left="0px");
// // catImg[0].style.left='100px';
//
// let callCatImg = function () {
//
// let newLeft =
//
// }
//
// let catImg = document.querySelector('img');
// catImg.style.position = 'absolute';
// catImg.style.left = '0px';
//
// let catWalk = function (){
// let oldTop = parseInt(catImg.style.left);
// let newTop = oldTop +5;
// catImg.style.left = newTop +'px';
//
// };
// window.setInterval(catWalk, 30)
//
//
//
//
//
//
//
// //jQuery mouseover function
//
//
// let $catImg = $("img#cat")
// //
// $catImg.mousemove(function(){
//  $catImg.attr("src","https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/7/7d/Dancing-cat.gif/revision/latest?cb=20160319144601");
// });
//
// $catImg.mouseleave(function(){
//  $catImg.attr("src","https://media2.giphy.com/media/kFgzrTt798d2w/200.webp");
// });
//
// $catImg.mousemove(function(){
//  $catImg.attr("src","https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/7/7d/Dancing-cat.gif/revision/latest?cb=20160319144601");
// });




//
// $catImg.mousemove(function(){
//  $catImg.attr("src","https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/7/7d/Dancing-cat.gif/revision/latest?cb=20160319144601")


//  }
// });
//

//catImg.src = "......."


//.window.innerWidth shows width of window

//
// const catImg = document.getElementsByTagName('img');
//
// catImg.style.position = 'absolute' ;
// catImg.style.left='0px';
//
// example lukes

let $cat = $('img.cat');

$cat.css('left', '0px');

const rightEdge = window.innerWidth - $cat.width();
let catStepAmount = 5;

const hasHitRightEdge = function (){
  return leftPos > rightEdge;
};

const hasHitLeftEdge = function (){
  return leftPost < 0;
};

const catWalk = function (){

//first get the current position of the cat, - as a number!
let leftPos = parseInt( $cat.css('left') );
leftPos += catStepAmount;

$cat.css('left', `${leftPos}px`); //20px
// console.log(leftPos);

// is the cats current position greater than the right edge of the screen
// if (leftPos > rightEdge) {
// //flipping value to positive
// catStepAmount *= -1;
//
// $cat.css ('transform', 'scaleX(-1)')
//
//
// } else if (leftPos < 0){
//   catStepAmount = 5;
//   $cat.css ('transform', 'scaleX(-1)')
//
// }

if ((leftPos > rightEdge) || (leftPos < 0) ) {
  catStepAmount *= -1;
  $cat.css("Transform", `scaleX(${Math.sign(catStepAmount)})`)
}

}; //end of catWalk ()

setInterval (catWalk, 70);
