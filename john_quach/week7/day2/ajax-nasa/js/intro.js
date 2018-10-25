console.log('JS Loaded!');

$(document).ready(function(){

  const numbersURL = 'http://numbersapi.com/random/trivia?json';

// $.get ( numbersURL)
// $.post (numbersURL)
  $.getJSON(numbersURL)
  .done(function( response ){
// Status is 200 for success it will run.
    console.log(response.number);
  })
  .fail(function (err){
// Status 404 or network error
    console.warn( err.statusText );
  });   //comma at end
  // .always(function( data ) {
  //  console.log('This will always run after success or a fail.');
  //  console.log( data );
  // });
}); //document ready
