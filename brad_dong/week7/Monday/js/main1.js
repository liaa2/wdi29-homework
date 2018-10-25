console.log('Working');

$(document).ready(function(){

  $("#submitButton").on('click', function(){

    let $movieName = $('#movieName').val();  //get name entered

    const xhr = new XMLHttpRequest();   //new XMLHttpRequest

    xhr.open('GET', `https://api.themoviedb.org/3/search/movie?api_key=24d863d54c86392e6e1df55b9a328755&query=${$movieName}`);

    xhr.send(); //send request

    xhr.onload = function(){
      const respo= JSON.parse(xhr.response);  //stores response, an object containing anarray of JS objects
      let resu= respo.results;
      console.log(resu);
      for (let i=0; i<resu.length; i++){
        $('#ul').append(`<p>${resu[i].title} (${resu[i].release_date})</p>`);
        $('#ul').append(`<li><img id="${resu.id}" src='http://image.tmdb.org/t/p/w185${resu[i].poster_path}'></li>`);
      }  //for loop end
    };  //onload end


  });  //end on click

















});  //end of document ready
