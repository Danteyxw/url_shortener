$(document).ready(function() {

  $("form[action='/shorten']").submit(function(event){
    event.preventDefault();

    $.ajax({
      method: "post",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      $(".response").empty();
      $(".response").append("<p>" + response + "</p>")
    })
  })

});
