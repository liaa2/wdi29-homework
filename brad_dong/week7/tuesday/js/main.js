console.log("derr");


$(document).ready(function(){

  $('#query').focus();  //auto focus on input field when reload

  $('#where').on('submit', function(){
    const $query= $('#query').val();
    searchDb($query);
    return false;  //return false in a form, makes the form not to be submitted, stops page reload
  });

  const searchDb = function(cityName){
    let API_REQUEST = `https://api.openaq.org/v1/locations?city[]=${cityName}`;
    console.log(API_REQUEST);
    $.getJSON(API_REQUEST)
    .done(displayResults)
    .fail(wrong);
  };  //end of searchDb function


  const displayResults = function(response){
    console.log(response.results);

    $('#resultsShow').show();
    if (response.results.length===0){
      $('#resultsShow').append("Your city is not in our database.")
    }else{
      $('#listCities').empty();
      for (let i=0; i<response.results.length; i++){
        let thisResult = response.results[i];
        $('#listCities').append(`<li>City: ${thisResult.city}<br>
          Location: ${thisResult.location}<br>
          Count: ${thisResult.count}</li>`)
        };
    }
  };

  const wrong = function(){
    $('#wrong').show();
  }
















});
