(function($) {

  $.fn.cloneFields = function(opts){
    var defaults = { itemWrapper: ".item", skipContainer: '.your-container' };
    var options = $.extend(defaults, opts);

    return $.dynamicFields.cloneFields(this, options);
  };

  $.fn.removeFields = function(opts){
    var defaults = { confirmationMessage: 'Are you sure?' };
    var options = $.extend(defaults, opts);

    var $items = this.parent();
    var destroy_field = $items.find("input[name$='[_destroy]']");

    if (confirm(options.confirmationMessage)) {
      if (destroy_field[0] != undefined) {
        destroy_field.val('true');
        $items.hide();
      }else {
        if ($items.siblings().find(".remove_dynamic_field")[0] != undefined){
          $items.remove();
        }else {
          $items.hide();
          $items.find(":input").each(function(){
            $(this).prop('disabled', true);
          })
        }
      }
      return true;
    }else{
      return false;
    }
  };

  $.dynamicFields = {

    findNumber: function(str){
      return parseInt(str.replace(/[^0-9]/ig, ''));
    },

    cloneFields: function(fields, options){
      var origin = fields.find(options.itemWrapper + ":last");

      if (origin[0] != undefined) {
        var item = origin.clone().show();
        item.find(options.skipContainer).remove();
        var item_num = $.dynamicFields.findNumber(item.find(':input:first').attr('id')) + 1;
        var new_id;
        var new_name;

        item.find("input[name$='[_destroy]']").remove(); // don't need to copy the _destroy field

        item.find(':input').each(function(){
          $(this).prop('disabled', false);

          if ($(this).attr('id')) {
            new_id = $(this).attr('id').replace(/\d/, ''+item_num);
            $(this).attr('id', new_id);
          }

          if ($(this).attr('name')){
            new_name = $(this).attr('name').replace(/\d/, ''+item_num);
            $(this).attr('name', new_name);
          }

          // reset all fields
          if ($(this)[0].type == 'textarea' || $(this)[0].type == 'text' || $(this)[0].type.match(/select/)){
            $(this).val("");
          }else if ($(this)[0].type == 'radio'){
            $(this).attr("checked", false);
          }else if ($(this)[0].type == 'checkbox'){
            $(this).attr("checked", false);
          }

        });

        item.find('label').each(function(){
          if ($(this).attr('for')){
            new_id = $(this).attr('for').replace(/\d/, ''+item_num);
            $(this).attr('for', new_id);
          }
        });

        item.insertAfter(origin);
        return item;
      }
    }
  };

})(jQuery);