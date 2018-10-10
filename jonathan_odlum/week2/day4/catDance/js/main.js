const Tuple = function(x, y){
  this.x = x;
  this.y = y;
};
Tuple.prototype.setXY = function(x,y){
  this.x = x;
  this.y = y;
};
Tuple.prototype.add = function (xOffset, yOffset) {
  this.x += xOffset;
  this.y += yOffset;
};
Tuple.prototype.distanceTo = function (coOrds) {
  const a = coOrds.x - this.x;
  const b = coOrds.y - this.y;
  const difference = new Tuple(a,b);
  const c = difference.getLength();
  return c;
}
Tuple.prototype.getLength = function (){
  return Math.abs(Math.sqrt(this.x**2 + this.y**2));
}
Tuple.prototype.getVector = function (coOrds) {
  vecX = coOrds.x - this.x;
  vecY = coOrds.y - this.y;
  let vector = new Tuple(vecX, vecY);
  return vector;
};

const Cat = function(x,y){
  this.catPos = new Tuple(x,y);
  this.foot = 2;
  this.img = $('<img>').attr('src', 'images/kitty-1.png');
  //Next line gets the image width for render offset.
  this.img.on('click', this.explode);
  let width = 75;
  let height = 95;
  this.img.css({
    position: 'absolute',
    width: `${width}px`,
    height: `${height}px`,
  });
  this.imgOffset = new Tuple( Math.round(width/2), Math.round(height/2) );
  this.updateImage();
}
Cat.prototype.moveTowards = function(tuple, currentPos){
  const vectorToMouse = currentPos.getVector(tuple);
  console.log(vectorToMouse);
  const movement = new Tuple(vectorToMouse.x/100, vectorToMouse.y/100);
  this.catPos.add(movement.x, movement.y);
  this.updateImage();
}
Cat.prototype.updateImage = function(){
  const position = new Tuple(Math.round(this.catPos.x) , Math.round(this.catPos.y));
  this.img.css({
    top: `${positio.y - this.imgOffset.y}px`,
    left: `${position.x - this.imgOffset.x}px`,
  })
}
Cat.prototype.act = function(tuple){
  const currentPos = new Tuple(this.catPos.x, this.catPos.y);
  const distance = currentPos.distanceTo(tuple);
  if (distance > 50){
    this.moveTowards(tuple, currentPos);
  }
}
Cat.prototype.step = function(){
  //min 2, max 5 per second.
  this.stepping =
}
Cat.prototype.explode = function(){
  //create rainbow-splat.
}

const mainLoop = function(){
  test.act(mousePos)
}

const screenWidth = parseInt(window.innerWidth);
const screenHeight = parseInt(window.innerHeight);
let mousePos = new Tuple(0,0);
let test;

onmousemove = function(e){
  mousePos.setXY(e.clientX, e.clientY);
}

$(document).ready(function(){
  test = new Cat(250,250);
  $('body').append(test.img);
  let run = setInterval(mainLoop, 5);
})



// document.addEventListener(mousemove)

// setInterval(update, 1);
