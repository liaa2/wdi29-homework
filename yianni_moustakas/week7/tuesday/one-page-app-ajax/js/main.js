
$(document).ready(function(){
  $('#query').focus();


  $(document).on('click', 'li.result', function(){
    $('#resultsContainer').hide();
    $('#detailsContainer span').empty();
    $('#detailsContainer').show();
    const id = $(this).attr('pokemon_id')
    performPokemonDetailsRequest(id);
  });


  $('#backToSearchResults').on('click', function(){
    $('#detailsContainer').hide();
    $('#resultsContainer').show();
  });

  const performPokemonDetailsRequest = function(pokemon_id){
    const url = `${pokemon_id}`
    $.getJSON(url)
    .done(displayPokemonDetails)
    .fail(function(error){
      console.warn(error.statusText);
    });
  }; //end of performPokemonDetailsRequest

  const displayPokemonDetails = function(response){
    console.log(response);
    $('#detailsContainer .number span').html(response.pokedex_numbers[(response.pokedex_numbers.length-1)].entry_number);
    $('#detailsContainer .name span').html(response.name);
    $('#detailsContainer .entry span').html(response.flavor_text_entries[(response.flavor_text_entries.length-2)].flavor_text);
    $('#detailsContainer .evolved span').html(response.evolves_from_species.name);
    $('#detailsContainer .generation span').html(response.generation.name);
  }; //end displayPokemonDetails



  const displayPokemonResults = function( response ){
    $('<h3>').html(response.main_region.name).appendTo('#searchResults');
    response.pokemon_species.forEach(function(pokemon){
      $('<li class="result">').html(pokemon.name).attr('pokemon_id', pokemon.url).appendTo('#searchResults');
    });
  }; // end of displayPokemonResults

  const performSearch = function(searchTerm){
    const url = `https://pokeapi.co/api/v2/generation/${searchTerm}/`;
    $.getJSON(url)
    .done(displayPokemonResults)
    .fail(function(error){
      console.warn(error.statusText);
    });
  }; //performSearch end

  $('#searchForm').on('submit', function(){
    const query = $('#query').val();
    $('#detailsContainer').hide();
    $('#searchResults').empty();
    $('#resultsContainer').show();
    performSearch(query);
    return false;
  });
});
