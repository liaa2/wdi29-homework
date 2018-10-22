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
        $('#ul').append(`<li id="li${resu[i].id}"><img id="${resu[i].id}" src='http://image.tmdb.org/t/p/w185${resu[i].poster_path}'></li>`);
        $(`#${resu[i].id}`).on('click', function(){
          $(`#li${resu[i].id}`).append('<div class="oneMovie"></div>')
          const xhr1 = new XMLHttpRequest();
          xhr1.open("GET", `https://api.themoviedb.org/3/movie/${resu[i].id}?api_key=24d863d54c86392e6e1df55b9a328755&language=en-US`)  ;
          xhr1.send();
          xhr1.onload = function(){
            const respon = JSON.parse(xhr1.response);
            console.log(respon);
            $('.oneMovie').append(respon.title);
            $('.oneMovie').append("Tagline: ",respon.tagline);
            $('.oneMovie').append("Overview: ",respon.overview);
            $('.oneMovie').css("visibility", "visible")

          }
        })
      }  //for loop end
    };  //onload end


  });  //end on click

















});  //end of document ready
