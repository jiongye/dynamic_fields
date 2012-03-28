//= require dynamic_fields/jquery.dynamic-fields

jQuery(function(){

  $("body").delegate(".remove_dynamic_field", 'click', function(){
    var destroy_field = $(this).parent().find("input[name$='[_destroy]']");

    if (destroy_field[0] != undefined) {
      if (confirm("Are you sure?")) {
        destroy_field.val('true');
        $(this).parent().hide();
      }
    }else {
      if ($(this).parent().siblings().find(".remove_dynamic_field")[0] != undefined)
        $(this).parent().remove();
      else
        $(this).parent().hide();
    }

    return false;
  });

});