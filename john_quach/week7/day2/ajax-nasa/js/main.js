$(document).ready(function() {
  let whoInSpace = function() {

  const issPeopleURL = 'http://api.open-notify.org/astros.json';

  $.getJSON( issPeopleURL )

  .done(function(results){
    //console.log(results.people);
    for (let i = 0; i < results.people.length; i++) {
      let $people = $("<li>").html(results.people[i].name)
    // let $people = $("<li>").html(results.people[i].name + ' ' + results.people[i].craft);
      $('#peopleInSpace').append($people)
    }

  }) //.done
  .fail(function( err ){
    console.warn( err.statusText );
  }); //fails
}; //whoInspace


  let issLocation = function() {
    $('#issLocation').empty()
    let issLocationURL = 'http://api.open-notify.org/iss-now.json';
    $.getJSON( issLocationURL )
    .done(function( resultLoc ){
      console.log( resultLoc );
      let position = resultLoc.iss_position;
      // let latitude = parseInt(position.latitude);
      // let longitude = parseInt(position.longitude);


      let latitude = parseFloat(position.latitude);
      let longitude = parseFloat(position.longitude);


      let $location = $('<p>').html("Latitude: " + latitude + "; Longitude: " + longitude);
      $('#issLocation').append($location);
      //The setInterval of issLocation is making the map flickr.  Delaying the //map refresh.
      // setInterval(issMap(latitude,longitude),10000);
      // $('#map')(setInterval(issMap(latitude,longitude),10000)).fadeout(10000);
      issMap(latitude,longitude);

    })
    .fail(function( err ){
      console.warn( err.statusText );
    }); //fails
  }; //issLocation

//https://developers.google.com/maps/documentation/javascript/examples/marker-simple
  function issMap(latitude, longitude) {
      let where = {lat: latitude, lng: longitude};
      const map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: where
      });
      let marker = new google.maps.Marker({
        position: where,
        map: map,
        title: "ISS"
      });

    };

  whoInSpace();
  //issLocation();
  setInterval(issLocation,5000);
});
