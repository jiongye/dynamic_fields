$(function(){

  $('#more_subcategories').click(function(){
    $("#subcategories").cloneFields({
      itemWrapper: ".nested_field"
    });
  })

})

