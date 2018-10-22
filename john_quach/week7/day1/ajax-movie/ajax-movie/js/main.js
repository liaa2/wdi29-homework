console.log('Movie Home Box Office');
$(document).ready(function(){
  $('#submitButton').on('click', function(){
    const query = $('#search').val();
    const url = "https://api.themoviedb.org/3/search/movie?api_key=24d863d54c86392e6e1df55b9a328755&query=" +  query
    console.log(url);
    const xhr = new XMLHttpRequest();

    xhr.onload = function(){
    const searchResults = JSON.parse(xhr.response);
    console.log( searchResults );

    for (let i = 0; i < searchResults.results.length; i++) {
    let result = result.results[i];
    console.log(i, result.title);
    let $output = $('<div class="main">').html(result.title);
    $('#main').append( $output);
    };
  };

  xhr.open('GET',url);
  xhr.send();
  console.log('Finished request');
});
});
