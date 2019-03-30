console.log("Movie DB - XMLHttpRequest");

$(document).ready(function(){

  // const showDetails = function(id){
  //   const xhrMovie = new XMLHttpRequest();
  //   xhrMovie.onload = function(){
  //     const movieDetails = JSON.parse(xhrMovie.response);
  //     let url = movieDetails.homepage;
  //     window.location = url;
  //   }
  //
  // }

  $('#submitButton').on('click', function(){
    const search = $('#searchQuery').val();
    // console.log(search);

    const xhr = new XMLHttpRequest();


    xhr.onload = function(){
      const $movieObject = JSON.parse(xhr.response)
      // const $resultText = $results.results;
      for (var i = 0; i < $movieObject.total_results; i++) {
        const $title = $(`<li class="titleResults">`).html($movieObject.results[i].title);
        const $image = $(`<img class="imageResults">`).attr('src', `https://image.tmdb.org/t/p/w500${$movieObject.results[i].poster_path}`);

        // $('.imageresults').on('click', function(){
        //   showDetails(movieObject.results[i].id)
        // });

        $('#results').append($image);
        $('#results').append($title);
      }

    }; //end of xhr.onload

    xhr.open('GET', `https://api.themoviedb.org/3/search/movie?api_key=24d863d54c86392e6e1df55b9a328755&query=${search}`)

    xhr.send();

    console.log("Finished request");
  }); //end of submit button

}); // End of document ready
