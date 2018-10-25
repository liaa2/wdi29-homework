// Text Soup
// Using HTML, CSS and JS + jQuery, create a web page which prints a random word from a large sample of text, in a random position on the page, every 100 milliseconds.
//
// Hints:
// Grab some plain text (20-50 paragraphs should do) from one the top 100 novels in the public domain at Project Gutenberg; paste the text into a hidden <div> element in your HTML file, and use jQuery to get the contents of the div.
// Bonus:
// Fade the text in to make it appear, and then fade it out to disappear, to stop the page getting too dense with texty text.
// Try random colours, random font sizes, rotation, whatever floats your boat.

$( document ).ready(function() {
  let timerId;
  let words = $('#hidden').text().split(" ")
  $('#hidden').empty();
  // $('.hidden')

  $.each(words, function(i, v) {
    $('#hidden').append($(`<span> ${v}</span>`))
  });

  const wordsSpit = function() {
    // ran = Math.floor(Math.random() * 20);
    ranNum = Math.floor(Math.random() * $('#hidden > span').length);
    console.log(ranNum);
      $(`#hidden :nth-child(${ranNum})`).addClass("show");
  }





//
const wordsPop = function () {
  timerId = setInterval(wordsSpit, 100);
};
wordsPop();

});
