

//Get the cat image
let catImage = document.querySelector('img');

//Make it left of 0
let leftSide = 0;
catImage.style.left = leftSide;
let zIndexCount = 1;

const getRandomNumber = function(min,max){
    return Math.floor(Math.random() * (max - min)) + min;
}

//Need to speed up the left cat to keep it interesting
let speedUpLeftCat = 0;

//Set the walking direction to start with
let walkingDirection = "leftToRight";

//Will need this variable later for adding more random stuff
let catsList = [];

//Function to speed up the left cat
const speedUpLeftCatFunc = function() {
  speedUpLeftCat += 1;
}

const changeBackground = function(){
  document.body.background="";
  let randomR = getRandomNumber(0,250);
  let randomG = getRandomNumber(0,250);
  let randomB = getRandomNumber(0,250);
  document.body.bgColor = `rgb(${randomR},${randomG},${randomB})`
  if (getRandomNumber(1,100)%7 ===0) {
    document.body.background = "images/cat-background.jpg";
  }
  if (getRandomNumber(1,100)%6 ===0) {
    document.body.background = "images/puppy-background.jpg";
  }
}

const makeCat = function(){
  //Create the new cat image
  let newCatImage = document.createElement('img');
  newCatImage.style = "position:absolute";
  newCatImage.className = "rainbowCat"
  newCatImage.src = "images/catRightToLeft.gif";
  newCatImage.style.display = "inline-block"

  newCatImage.style.left = `${leftSide}px`; //Give same left as existing RtoL cat

  //Make it a bit smaller
  newCatImage.style.width = "200px";
  newCatImage.style.height = "100px";

  //Set the top offset
  newCatImage.style.top = `${getRandomNumber(0,750)}px`;

  //Set the z index so they can overlap a bit
  newCatImage.style.zIndex = zIndexCount;
  zIndexCount += 1;

  document.body.appendChild(newCatImage);
}

const catWalk = function(){

  changeBackground();
  speedUpLeftCatFunc();

  //Get how far left it has moved, so we can check if time to switch
  leftSide = Number(catImage.style.left.replace("px", "")); //NOTE:parseint
  let screenWidth = document.querySelector('body').clientWidth; //NOTE: window.innerWidth

  // Check if reached end of screen and turn around
  if (leftSide > screenWidth +20) {
    walkingDirection = "rightToLeft";
    catImage.src = "images/catRightToLeft.gif";
    makeCat();
  }
  if (leftSide < -400) {
    walkingDirection = "leftToRight";
    catImage.src = "images/catLeftToRight.gif"
  };
  //Add multiplier to get this cat across faster
  if (walkingDirection === "leftToRight") {
    leftSide += 10 +speedUpLeftCat;
    catImage.style.left = `${leftSide}px`;
    return
  }
  //If going right to left will hit this spot
  leftSide -= 55;
  catsList = document.querySelectorAll('.rainbowCat');
  for (let i = 0; i < catsList.length; i++) {
   catsList[i].style.left = `${leftSide}px`;
   }
  catImage.style.left = `${leftSide}px`;

}

//Create a div for the button and image
buttonDiv = document.createElement('div');
buttonDiv.className = 'monkeyButtonDiv';
buttonDiv.style = "position:absolute; top:40%; left:40%; height:500px; width:450px";
document.body.appendChild(buttonDiv);

//Create the button
monkeyButton = document.createElement('button');
monkeyButton.setAttribute('type', 'button');
monkeyButton.className = 'addMonkeyButton';
monkeyButton.style = "height: 75px; display: block; margin:0 auto; border-radius:65%; font-size: 24px;\
background:red; border: solid 2px black; font-weight: 700; z-index:2;"
monkeyButton.textContent = "Press for monkeys";
document.querySelector('.monkeyButtonDiv').appendChild(monkeyButton);

//Create the static image
buttonImage = document.createElement('img');
buttonImage.src = 'images/button-press-STATIC.png';
buttonImage.style = 'height: 350px; width: 450px; padding-top:5px;';
buttonDiv.appendChild(buttonImage);

//The files to add monkeys
const monkeyFiles = [
  {'location': 'images/monkey-dance.gif'},
  {'location': 'images/monkey-dance-2.gif'},
  {'location': 'images/monkey-dance-3.gif'},
  {'location': 'images/monkey-dance-4.gif'},
  {'location': 'images/monkey-dance-5.gif'},
  {'location': 'images/monkey-dance-6.gif'},
  {'location': 'images/monkey-dance-7.gif'},
]


const addMonkey = function(){

  //Some code to run a gif when we press the button
  buttonImage.src = 'images/button-press-GIF.gif'

  const changeBackFromGif = function(){
    buttonImage.src = 'images/button-press-STATIC.png'

    monkeyToAdd = getRandomNumber(0,monkeyFiles.length)
    let newMonkeyImage = document.createElement('img');
    newMonkeyImage.src = monkeyFiles[monkeyToAdd].location;

    //Add a random class to make it able to spin
    if ((getRandomNumber(5,20))%2 ===0) {
      newMonkeyImage.className = "monkeyImagesToSpin";
    }
    const screenWidth = document.querySelector('body').clientWidth;
    const monkeyImgPosition = [getRandomNumber(20,screenWidth), getRandomNumber(30,650)]
    newMonkeyImage.style = `position:absolute; height: 150px; width: 150px; left: ${monkeyImgPosition[0]}px; top: ${monkeyImgPosition[1]}px`;
    document.body.appendChild(newMonkeyImage);

  }

  setTimeout(changeBackFromGif, 1800); //Put the changeBackFromGif as anonymous inside Timeout here
}

monkeyButton.addEventListener('click', addMonkey);

//Now to make our monkeys spin
let headStyleTag = document.createElement('style')
headStyleTag.innerHTML = ".monkeyImagesToSpin:hover{transition:3s;transform:rotate(720deg);}";
document.body.appendChild(headStyleTag);

//UNCOMMENT THIS;
let playMusic = document.createElement('audio');

//Make a music autoplay thing

// playMusic.setAttribute('controls', "");
playMusic.setAttribute('autoplay', "");
playMusic.style = 'position:absolute; top:55%; left:10%;';
let musicSource = document.createElement('source');
musicSource.setAttribute('src', 'backgroundAudio.mp3');
musicSource.setAttribute('type', 'audio/mpeg');
playMusic.appendChild(musicSource);
document.body.appendChild(playMusic);



//Autoplay if chrome settings not set to allow autoplay
// function playAudio() {
//     playMusic.play();
// }
//
// playAudio();

//UNCOMMENT THIS;
// setInterval(catWalk, 110);
