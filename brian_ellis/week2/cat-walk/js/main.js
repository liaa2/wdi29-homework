console.log('loaded!');

const $cat = $('img');
console.log( $cat );

// setInterval
// $("img").fadeOut();

$(document).ready(function() {
    // $("img.dancer").hide();
    $("img.cat").animate({left: "600"}, 3000);
    $("img.cat").animate({left: "-700"}, 4000);
    $("img.cat").animate({left: "800"}, 5000);
// img.cat left === 800 ? $("img.cat").hide(); : $("img.cat").show();
// _______________________________________________________________________________
// _______________________________________________________________________________
// var cattyCat = $("img.cat");
// cattyCat.css('position') === $("img.cat").hide(); : $("img.cat").show();
// _______________________________________________________________________________
// _______________________________________________________________________________


    // for blackCat (let i=0; i > 5; i++) {};

    // $('img.cat').each(function(i) {
    //   $(this);
    // });
    // $("img.cat").hide();



    // $("img.dancer").show();
    // $("img.dancer").fadeOut();
    // $("img").animate({left: "-=300"}, 1000);
    // $("img").animate({left: "+=300"}, 3000);
});
