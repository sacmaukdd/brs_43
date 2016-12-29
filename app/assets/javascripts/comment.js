$(document).on('ready page:load', function(event) {
  $(document).on("submit",".new_comment",function(){
    $(".text_comment").val(" ");
  });
});
