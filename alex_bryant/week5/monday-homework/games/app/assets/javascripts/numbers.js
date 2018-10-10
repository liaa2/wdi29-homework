
const setListeners = function () {

  for (let i=1; i<11; i+=1) {
    $("#" + i).on('click', function() {
      $("#secret1").attr("value", i);
      $("#secret2").trigger('click');
    });
  }

}

$().ready(function() {
  setListeners();
})
