$(document).ready(function(){

  $(".sortable").on("change", function(){
    $(".sortbutton").trigger("click")
  })

  $(".fave-link").on("click", function(){
    $(".faves-box").toggleClass("hidden")
  })

});
