
$().ready (function() {

  console.log("JQuery loaded");

  const words = $("#words").text().split(/[ ,."';\n\-]+/);

  const $body = $("body");

  const random = function(max) {
    return Math.floor(Math.random() * max);
  }

  const putWord = function () {
    const randomIndex = random(words.length);
    const text = words[randomIndex];

    const $div = $("<div class='word'>").text();

    $div.css({
      top: random(window.innerHeight) + "px",
      left: random(window.innerWidth) + "px",
      fontSize: (40 + random(80)) + "px",
      color: "rgb(" + random(255) + ", " + random(255) + ", " + random(255) + ")"
    });

    $div.appendTo($body);

    $div.fadeIn(1000).fadeOut(2000, function() {
      $(this).remove();
    })

  }

  setInterval(putWord, 100);


});
