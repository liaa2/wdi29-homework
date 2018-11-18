$.ajax({
  url: "http://localhost:3000/tests",
  context: document.body
}).done(function() {
  $( this ).addClass( "done" );
});
