console.log("Movies DB homework loaded");

const apiKey = "######";
const searchURLBase = "https://api.themoviedb.org/3/search/movie?";
const movieURLBase = "https://api.themoviedb.org/3/movie/";
const imageURLBase = "http://image.tmdb.org/t/p/w185/";

const movieDetails = function (movieID) {

  const xhr = new XMLHttpRequest();

  xhr.onload = function(){
    const movie = JSON.parse(xhr.response);
    //console.log(movie);

    $movieData = $('<div id="movie">');

    //hide the list of all movies
    $('#movies').hide();
    $('#search').hide();

    $title = $(`<h1>`);
    $backLink = $(`<p class="smaller-text">`)
    $poster = $(`<img src="${imageURLBase + movie.poster_path}" alt="No image available">`);
    $overviewTitle = $(`<h3>`);
    $overview = $(`<p class="movie-desc">`);
    $releaseDateTitle = $(`<h3>`);
    $releaseDate = $(`<p>`);
    $revenueTitle = $(`<h3>`);
    $revenue = $(`<p>`);
    $runtimeTitle = $(`<h3>`);
    $runtime = $(`<p>`);
    $title.text(movie.title);
    $backLink.text("< back to list");
    $backLink.click(function(){
      $('#movies').show();
      $('#search').show();
      $('#movie').remove();
    })
    $overviewTitle.text("Overview:");
    $overview.text(movie.overview);
    $releaseDateTitle.text(`Release Date:`);
    $releaseDate.text(movie.release_date);
    $revenueTitle.text(`Revenue (US$):`);
    $revenue.text(movie.revenue);
    $runtimeTitle.text(`Run Time (minutes):`);
    $runtime.text(movie.runtime);
    $movieData.append($title);
    $movieData.append($backLink);
    $movieData.append($poster);
    $movieData.append($overviewTitle);
    $movieData.append($overview);
    $movieData.append($releaseDateTitle);
    $movieData.append($releaseDate);
    $movieData.append($revenueTitle);
    $movieData.append($revenue);
    $movieData.append($runtimeTitle);
    $movieData.append($runtime);

    $('#results').append($movieData);

  }

  xhr.open('GET', `${movieURLBase + movieID}?api_key=${apiKey}`);

  xhr.send();

  console.log('Finished request');

};

$().ready(function(){

  $('#movie-search').click(function(){

    $('#movies').remove();

    const searchText = $('#movie-text').val();

    const xhr = new XMLHttpRequest();

    xhr.onload = function(){
      const movies = JSON.parse(xhr.response);
      //console.log(movies);

      const $movieList = $('<div id="movies">');

      $list = $('<ul>');
      for (let i=0; i<movies.results.length; i+=1) {
        $listItem = $(`<li id='movie_${i+1}'>`);
        $title = $(`<h3>`);
        $overview = $(`<p>`);
        $poster = $(`<img src="${imageURLBase + movies.results[i].poster_path}" alt="No image available">`);
        $posterText = $(`<p class="smaller-text">`);
        $posterText.text("Click image for more information");
        $poster.click(function(){
          movieDetails(movies.results[i].id);
        })
        $title.text(movies.results[i].title);
        $overview.text(movies.results[i].overview);
        $listItem.append($title);
        $listItem.append($overview);
        $listItem.append($poster);
        $listItem.append($posterText);
        $list.append($listItem);
      }
      if(movies.results.length === 0) {
        $movieList.append($(`<br><p><strong>No results found</strong></p>`));
      }
      $movieList.append($list);

      $('#results').append($movieList);
    }

    xhr.open('GET', `${searchURLBase}api_key=${apiKey}&query=${searchText}`);

    xhr.send();

    console.log('Finished request');

  });

});
