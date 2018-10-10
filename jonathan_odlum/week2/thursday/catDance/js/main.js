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
Tuple.prototype.getDistance = function (coOrds) {
  const a = coOrds.x - this.x;
  const b = coOrds.y - this.y;
  const c = Math.sqrt(a**2 + b**2);
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
  const distanceToMouse = currentPos.getVector(tuple);
  console.log(distanceToMouse.getLength());
  const movement = new Tuple(distanceToMouse.x/100, distanceToMouse.y/100);
  this.catPos.add(movement.x, movement.y);
  this.updateImage();
}
Cat.prototype.updateImage = function(){
  const position = new Tuple( Math.round(this.catPos.x) , Math.round(this.catPos.y) );
  this.img.css({
    top: `${position.y - this.imgOffset.y}px`,
    left: `${position.x - this.imgOffset.x}px`,
  })
}
Cat.prototype.act = function(tuple){
  const currentPos = new Tuple(this.catPos.x, this.catPos.y);
  const distance = currentPos.getDistance(tuple);
  if (distance > 50){
    this.moveTowards(tuple, currentPos);
  }
}
Cat.prototype.step = function(distance){
  //min 2, max 5 steps per second.
  const stepsPerSecond = -(distance/150) + 16/3;
  const framesForStep = 1000/5 * stepsPerSecond;
  const footDown = 10;

  //Step cycle: x% foot down, 100-x% in air.
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

let run;
$(document).ready(function(){
  test = new Cat(250,250);
  $('body').append(test.img);
  run = setInterval(mainLoop, 5);
})



// document.addEventListener(mousemove)

// setInterval(update, 1);
