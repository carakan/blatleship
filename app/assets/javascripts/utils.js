$(document).ready(function(){

  $(".table.disabled_false .elem").click(function(){
    $.get("/games/" + $(this).data("cords"))
  })

  setTimeout(function(){window.location.reload(false);}, 5000)
})

