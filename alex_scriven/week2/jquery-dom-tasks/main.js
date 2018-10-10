
// My work
// const bodyJQ = $('body');
// const keydown = $('.keydown');
// const keypress = $('.keypress');
// const keyup = $('.keyup');
//
// bodyJQ.on('keydown', function(event){
//   keydown.css('color', 'hotpink');
// });
//
// bodyJQ.on('keypress', function(event){
//   keypress.css('color', 'red');
// });
//
// bodyJQ.on('keyup', function(event){
//   keyup.css('color', 'blue');
// });


//Some answers (codealong with Luke)

const handleKeyDown = function(event){
  console.log(`The ${event.key} key was pressed down`);
  /*If we want to stop the default action (like space bar
  causing then screen to scroll down) */
  // event.preventDefault(); //So event has methods as well
}

const handleKeyUP = function(event){
  console.log(`The ${event.key} key was pressed up`);
  /*If we want to stop the default action (like space bar
  causing then screen to scroll down) */
  // event.preventDefault(); //So event has methods as well
}

// $(document).on('keydown', handleKeyDown);

//Note how this will fire when we release the key
$('input[type=text]').on( 'keyup', handleKeyUP)

//Look at the difference in focus and blur
$('input[type=text]').on( 'focus', function(){
  console.log('this is focussed');
});

$('input[type=text]').on( 'blur', function(){
  console.log('this is blurred');
  //Now let us get the form value that was entered
  console.log(`These letters were written ${$(this).val()}`)
});

//Now let us do something when the form was submitted
$('form').on('submit', function(){
  console.log('The form is submitted');
  /*Note the 'preserve log option in chrome can help if
  the console log disappears too quickly*/
  //For form submit callback it makes sense to return false
  return false //This will stop the form from actually submitting
});


//How about some clicking of images
const handleImageClick = function(){
  console.log('Image was clicked');
  //Note that we need to jqury-ify our this
  $(this).attr('src','http://placekitten.com/400/300');
  //We coudl also slide toggle to get it to disappear
  // $(this).slideToggle(5000);
  //Or we can animate it (we need to give it a position first)
  $(this).css('position', 'relative');
  //Now we make it to go left 400px in 2 seconds
  $(this).animate({left:'400px'}, 2000);
}

$('#kitty').on('click',handleImageClick);

//Now on some hovering of the image
const mouseEnterCallBack = function(){
  console.log('mouse entered image area');
}
const mouseExitCallBack = function(){
  console.log('Mouse has left image area');
}

//Hover takes two functions for when it enters and leaves
$('#kitty').hover(mouseEnterCallBack, mouseExitCallBack);

$('#kitty').on('mousemove', function(event){
  console.log(`Mouse moved ${event.clientX}, ${event.clientY}`);
  //Note that this is the window location
  //Need to use offsetX and offsetY to get location for image
  console.log('Mouse has moved in image!');
});

//Now toggling some visibility off and on
$('#toggle').on('click', function(){
  $('.triple-kitty1').toggle();
  //swapping the display none between them
});

/*
Note that we should put our scripts in the header
In order to do this we should wrap everything in
document.ready() that requires elements of the
page. 
*/
