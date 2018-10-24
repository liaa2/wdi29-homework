const URL = "https://pokeapi.co/api/v2"

$(document).ready(function(){

  //append options via json from URL/type/
  const appendOptions = function(typesObject) {
    typesObject.results.forEach(function(type){
      $(`<option>${type.name}</option>`).appendTo($('select'))
    })
  }

  // make select input and submit button
  $('<select id="queryType"></select>').appendTo($('#form'))
  $('<button>Search</button>').appendTo($('#form'))
  // make a request for types of pokemon from URL/type/
  const typeUrl = `${URL}/type/`
  $.getJSON(typeUrl)
  .done(appendOptions)


  // cleaning show and hides
  $('#backResults').on('click', function(){
    $('#pokeDetailsContainer').hide();
    $('#resultsContainer').show();
    $('#pokeDetailsContainer span').empty();
    $('img').attr("src", "");
  });


  // display the details. array required for types since it returns an array of objects with the type name inside the object elements.
  const displayDetails = function(details) {
    $('div#name span').html(details.name);
    $('img#icon').attr("src", details.sprites.front_default);
    $('img#shinyIcon').attr("src", details.sprites.front_shiny);
    
    let typesArray = [];
    const typesList = details.types.forEach(function(type){
      typesArray.push(type.type.name)
    })
    $('div#types span').html(typesArray.join(', '));

    let abilitiesArray = [];
    const abilitiesList = details.abilities.forEach(function(ability){
      abilitiesArray.push(ability.ability.name)
    })
    $('div#abilities span').html(abilitiesArray.join(', '));
  }

  // when name is clicked, ask for the pokemon's details via API. returns JSON. on succeed, displayDetails function.
  const getPokemonDetails = function(name){
    const pokemonURL = `${URL}/pokemon/${name}/`
    $.getJSON(pokemonURL)
    .done(displayDetails);
  }

  // attach click handler using event delegation. run getPokemonDetails on click.
  $(document).on('click', 'li.resultsType', function(){
    $('#resultsContainer').hide();
    $('#pokeDetailsContainer').show();
    const pokemonName = $(this).html()
    getPokemonDetails(pokemonName)
  });

  const displayTypes = function(response) {
    response.pokemon.forEach(function(poke){
      $('<li class="resultsType">').html(poke.pokemon.name).appendTo('#resultList')
    })
  };

  // get the types (e.g electric) JSON. display the types with function displayTypes
  const searchTypes = function(pokeType){
    const url = `${URL}/type/${pokeType}/`
    $.getJSON(url)
    .done(displayTypes);
  }; // searchTypes

  // on submit, run searchTypes. clears spans, img, results of types(from prev). return false to get rid of auto-refresh on submit.
  $('#form').on('submit', function(){
    $('#resultsContainer').show();
    $('#pokeDetailsContainer').hide();
    $('#pokeDetailsContainer span').empty();
    $('img').attr("src", "");
    $('#resultList').empty();
    searchTypes($('#queryType').val());
    return false
  }); //form submit




}); //document ready
