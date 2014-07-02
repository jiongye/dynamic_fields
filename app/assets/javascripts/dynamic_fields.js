//= require dynamic_fields/jquery.dynamic_fields

// jQuery(function(){
//
//   $("body").delegate(".remove_dynamic_field", 'click', function(){
//     var $items = $(this).parent()
//     var destroy_field = $items.find("input[name$='[_destroy]']");
//
//     if (destroy_field[0] != undefined) {
//       if (confirm("Are you sure?")) {
//         destroy_field.val('true');
//         $items.hide();
//       }
//     }else {
//       if ($items.siblings().find(".remove_dynamic_field")[0] != undefined)
//         $items.remove();
//       else
//         $items.hide();
//         $items.find(":input").each(function(){
//           $(this).prop('disabled', true);
//         })
//     }
//
//     return false;
//   });
//
// });