const cat = document.querySelector("img");
cat.style.left = '0px';
cat.style.top = '450px';
let returnWidth = window.innerWidth - cat.width;
let returnHeight = window.innerHeight - cat.width;
let animateright;
let oldLeft, newLeft;
let dancingCat;

console.log(cat);
const  catWalk = function(){
  oldLeft = parseInt(cat.style.left);
  newLeft = oldLeft + 10;
  cat.style.left = newLeft + 'px';
  if(parseInt(cat.style.left) >= returnWidth){
    cat.style.transform = "scaleX(-1)";
    animateright = setInterval(walkBack,100);
    clearInterval(animate);
  }
};

const walkBack = function() {
    newLeft = newLeft - 10;

    let dancingCat = parseInt(cat.style.left);
    // console.log( switchMiddle );

    if (newLeft <= (dancingCat / 2)) {
      cat.src = 'http://www.nnhs65.com/RWS/ani-dancing-cat.gif';
    }
    cat.style.left = newLeft + 'px';
      if(parseInt(cat.style.left) === 0){
        cat.style.transform = "scaleX(1)";
        animate = setInterval(catWalk,100);
        clearInterval(animateright);
      }
}
let animate = setInterval(catWalk,100);
