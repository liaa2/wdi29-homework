$(document).ready(function(){

  const showDetails = function(id){
    // console.log(id);
    const xhrMovie = new XMLHttpRequest();
    xhrMovie.onload = function() {
      const movieDetails = JSON.parse(xhrMovie.response);
      let url = movieDetails.homepage;
      window.location = url;
    };

    xhrMovie.open('GET', `https://api.themoviedb.org/3/movie/${id}?api_key=24d863d54c86392e6e1df55b9a328755`);
    xhrMovie.send();
  }; //show Details

  $('#submitButton').on("click", function(){

    $('#resultList').empty();

    const movieSearch = $('#queryMovie').val();
    const xhr = new XMLHttpRequest();

    xhr.onload = function(){
      const moviesObject = JSON.parse(xhr.response);


      for (let i = 0; i < moviesObject.results.length; i++) {
        // console.log(moviesObject.results[i]);
        const $title = $(`<li class="titleResults"></li>`).html(moviesObject.results[i].title)
        const $image = $('<img class="movieImage">').attr('src', `https://image.tmdb.org/t/p/w200/${moviesObject.results[i].poster_path}`);

        $image.on('click', function(){
          showDetails(moviesObject.results[i].id);
        });

        $('#resultList').append($title);
        $('#resultList').append($image);

      } // for loop
    } // xhr onload

    xhr.open('GET', `https://api.themoviedb.org/3/search/movie?api_key=24d863d54c86392e6e1df55b9a328755&query=${movieSearch}`);
    xhr.send();
  }); //onclick
}); // $(document).ready()
