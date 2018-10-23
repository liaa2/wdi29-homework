//console.log("Loaded");
const URL_BASE = "https://min-api.cryptocompare.com/data/histoday?fsym=";

//Selected currencies
const selectedItems = {
  crypto: 'BTC',
  fiat: 'USD',
  days: 500
}

const createChartPoints = function (numbers) {
  const points = [];
  numbers.forEach(function(number){
    const hashHolder = {};
    hashHolder['y'] = number;
    if(number === Math.max(numbers)) {
      hashHolder['indexLabel'] = "highest";
      hashHolder['markerColor'] = "red";
      hashHolder['markerType'] = "triangle";
    } else if(number === Math.min(numbers)) {
      hashHolder['indexLabel'] = "lowest";
      hashHolder['markerColor'] = "DarkSlateGrey";
      hashHolder['markerType'] = "cross";
    }
    points.push(hashHolder);
  });
  return points;
};

const getChart = function (numbers) {
  const plotPoints = createChartPoints(numbers);

  var chart = new CanvasJS.Chart("chartContainer", {
  	animationEnabled: true,
  	theme: "light2",
  	title:{
  		text: `Crypto price chart (${selectedItems.days} days)`
  	},
  	axisY:{
  		includeZero: false
  	},
  	data: [{
  		type: "line",
  		dataPoints: plotPoints
  	}]
  });
  return chart;
};

$().ready(function(){

  // Function to add and remove a class from a jquery object
  const addAndRemoveClasses = function ($selectedItems, addClass, removeClass) {
    $selectedItems.addClass(addClass);
    $selectedItems.removeClass(removeClass);
  };

  $('#textInput').on('change', function () {
    $('#textInput').val();
    selectedItems.days = $('#textInput').val();
    plotGraph();
  });

  //Perform a search whenever new buttons are pressed
  $(document).on('click', 'button.btn', function(event) {
    //Change classes of selected/unselected buttons
    if($(this).hasClass("btn-primary") || $(this).hasClass("btn-secondary")) {
      addAndRemoveClasses($(this), "btn-primary", "btn-secondary");
      addAndRemoveClasses($(this).siblings(), "btn-secondary", "btn-primary");
      selectedItems.crypto = $(this).text();
    } else if ($(this).hasClass("btn-info") || $(this).hasClass("btn-outline-info")) {
      addAndRemoveClasses($(this), "btn-info", "btn-outline-info");
      addAndRemoveClasses($(this).siblings(), "btn-outline-info", "btn-info");
      selectedItems.fiat = $(this).text();
    }
    plotGraph();
  });

  const plotGraph = function () {
    const url = `${URL_BASE + selectedItems.crypto}&tsym=${selectedItems.fiat}&limit=${selectedItems.days}&aggregate=3&e=CCCAGG`;
    performSearch(url, displayCurrencyDetails);
  };

  const displayCurrencyDetails = function (response) {

    //console.log(response);

    const data = [];

    response.Data.forEach(function(dataPoint){
      data.push(dataPoint.close);
    });

    //console.log(data);

    getChart(data).render();

  };

  //Perform an API search generic function, passing in url and
  //function to perform after if successful
  const performSearch = function(url, func) {

    $.getJSON(url)
    .done(func)
    .fail(function(error){
      $('#detailsContainer').append('<p class="error">Error getting details</p>');
    });

  };

  plotGraph();

});
