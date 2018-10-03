console.log("Cats be walkin");
let cat = document.querySelector('img');
cat.style.left = 0;
cat.style.top = 0;
cat.style.transform.scaleX
let going = "left";

const turnAround = function(image){
  if (going === 'left'){
    going = 'right';
    image.style.transform = "scaleX(-1)";
  } else {
    going = 'left';
    image.style.transform = "scaleX(1)";
  }
}

const catWalk = function(){
  let left = parseInt(cat.style.left);
  let screenWidth = parseInt(window.innerWidth);
  let catPos = parseInt(cat.style.left);
  let catWidth = parseInt(cat.width);
  if(catPos + catWidth <= screenWidth && going === 'left'){
    left += 10;
  }else if( catPos >= 0 && going === 'right'){
    left -= 10;
  }else{
    turnAround(cat);
  }
  cat.style.left = left + 'px';
}

let walkCat = setInterval(catWalk, 50);
