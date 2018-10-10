
// console.log('loaded!');
//
// // const cat = $('img');
// const cat = document.querySelector("img");
// cat.style.left = '0px';
// let returnWidth= window.innerWidth;
//
// let oldLeft = 0;
// let newLeft = 0;
//
// const catWalk = function () {
//   // this will run every 100ms
//   // ????????
//   oldLeft = parseInt(cat.style.left);
//   newLeft = oldLeft + 10;
//   cat.style.left = newLeft + 'px';
//
// };
//
// setInterval(catWalk, 100);

//
// const cat = document.querySelector("img");
// cat.style.left = '0px';//???what is this?
// let returnWidth = window.innerWidth -296;
// // let animateright;
// let oldLeft = 0;
// let newLeft;
//
//
// const  catWalk = function(){
//  oldLeft = parseInt(cat.style.left);
//  newLeft = oldLeft + 10;
//
//  cat.style.left = newLeft + 'px';
// }
// setInterval(catWalk, 50);


//Luke
// const $cat = $('img');
//
// $cat.css('left','0px');
//
// const rightEdge = window.innerWidth - $cat.width();
// let catStepAmount = 5;
//
// const catWalk = function(){
//
// //first get the current postion of the catWalk
// let leftPos = parseInt($cat.css('left') );
// console.log(leftPos);
// // leftPos = leftPos + 5; exactly the same code as below
// leftPos += catStepAmount;//by defaukt, add 5 to leftpos
//
// $cat.css('left',`${leftPos}px`);//20px
// // console.log(leftPos);
//
//
// //if the cat's current position greater then the right of the screen?
// if (leftPos > rightEdge ) {
//   catStepAmount *= -1;
//   $cat.css('trasnform','scaleX(${Math.sign(catStepAmount)})');
// } else if ( leftPos < 0){
//   catStepAmount *= -1;
//   $cat.css('trasnform','scaleX(1)');
// }
//
// };// end of catWalk()
//
// setInterval (catWalk, 30);
const $catImg = $('img'); //storing cat img bu using <img> tag with JQ.
$catImg.css('left', '0px');// set the cat img postion
let leftPx;
let oldLeft=0;
let newLeft=0;
let newLeftPx;

const catWalk = function (){ //crate a function that moves the cat img from left to right by 10px
 leftPx = $catImg.css('left'); //store the current left value of cat img in px into leftPx. eg "10px"

 oldLeft = parseInt(leftPx);// return just number leftValue & getting rid of px eg 10
 newLeft = oldLeft + 10; //eg 10+10 = 20
 newLeftPx = newLeft + 'px'; //adding 'px' to newleft e.g.20px
 $catImg.css('left',newLeftPx);// set a cat img to newLeft value
}
setInterval(catWalk,50);
