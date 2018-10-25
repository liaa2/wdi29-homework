$().ready(() => {

  let page = 1;
  const BASE_URL = `https://api.flickr.com/services/rest/`;
  const API_KEY = '2f5ac274ecfac5a455f38745704ad084';

  //Focus the cursor into the search text field as
  // soon as the page loads - so users can immediately
  //start typing their search jquery
  //(or when debugging, so we can just press enter to search
  // to submit once the page has loaded)
  $('#searchText').focus();

  const $searchResultsDiv = $('#searchResults');
  const $individualResultDiv = $('#individualResult');
  const $imageDetailsDiv = $('#imageDetails');

  //Back link handler
  $('.backLink').on('click', () => {
    $searchResultsDiv.show();
    $individualResultDiv.hide();
    $imageDetailsDiv.empty();
  });

  $(window).on('scroll', () => {

      const scrollBottom = $(document).height() - ($(window).height() + $(window).scrollTop());

      if(scrollBottom < 5) {
        const query = $('#searchText').val();
        page++;
        throttledSearchFlickr(query);
      }

  });

  //Step 1.
  //Respond to the form being submitted
  $('#searchForm').on('submit', () => {
    //Get the search text entered into the text field
    const query = $('#searchText').val();

    $searchResultsDiv.empty();

    console.log('query: ', query);

    //Step 2.
    //Call search function to perform AJAX query,
    //passing it the search text from the form
    searchFlickr(query, page);

    return false; //To avoid submitting the form
  });//form submit handler

  const searchFlickr = (queryText) => {

    sendQuery({
      api_key: API_KEY,
      method: 'flickr.photos.search',
      text: queryText,
      format: 'json',
      nojsoncallback: 1,
      page: page
    }, displaySearchResults);

  };

  const getImageSizes = (id, detailsResponse) => {

    sendQuery({
      api_key: API_KEY,
      method: 'flickr.photos.getSizes',
      photo_id: id,
      format: 'json',
      nojsoncallback: 1,
    }, function(response){ return displayImageDetails(response, detailsResponse); });
    // Above is a great way to pass a function with arguments
  };

  const getImageDetails = (id) => {

    sendQuery({
      api_key: API_KEY,
      method: 'flickr.photos.getInfo',
      photo_id: id,
      format: 'json',
      nojsoncallback: 1,
    }, function(response){ return getImageSizes(id, response); });

  };

  const sendQuery = (params, func) => {

    $.getJSON(BASE_URL, params)
    .done(func)
    .fail(console.warn);

  };

  //Step 4.
  // Create the function which is called by the .done() in our AJAX
  //query above; this function takes the
  //response data as its argument,
  //loops through it, and renders it to the page.
  const displaySearchResults = response => {
    // console.log('response', response);

    response.photos.photo.forEach(foto => {
      const thumbnailURL = generateImageURL(foto);
      $(`<img id=${foto.id}>`).attr('src', thumbnailURL).appendTo($searchResultsDiv);
      //Add click handler to each image based on the id of the Image
      //so that the next api call containing the id can be sent again
      //if the user clicks on the image
      $(`#${foto.id}`).on('click', () => {
        console.log(foto.id);
        getImageDetails(foto.id);
        $searchResultsDiv.hide();
        $individualResultDiv.show();
      });
    });

  }; //displaySearchResults

  const displayImageDetails = (response, detailsResponse) => {
    console.log('response', response);
    console.log('detailsResponse', detailsResponse);

    $(`<p>`).text(`Owner: ${detailsResponse.photo.owner.username}`).appendTo($imageDetailsDiv);
    $(`<p>`).text(`Date Taken: ${detailsResponse.photo.dates.taken}`).appendTo($imageDetailsDiv);
    $(`<img>`).attr('src', response.sizes.size[8].source).appendTo($imageDetailsDiv);
    // console.timeEnd('displayLoop');

  }; //displayImageDetails

  const generateImageURL = (photo) => {
    return `https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_q.jpg`;
  };

  const throttledSearchFlickr = _.throttle(searchFlickr, 2000);

});
