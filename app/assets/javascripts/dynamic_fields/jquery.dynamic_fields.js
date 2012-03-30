(function($) {

  $.fn.cloneFields = function(opts){
    var defaults = { itemWrapper: ".item" };
    var options = $.extend(defaults, opts);

    return $.dynamicFields.cloneFields(this, options)
  }

  $.dynamicFields = {

    findNumber: function(str){
      return parseInt(str.replace(/[^0-9]/ig, ''));
    },

    cloneFields: function(fields, defaults){
      var origin = fields.find(defaults.itemWrapper + ":last");

      if (origin[0] != undefined) {
        var item = origin.clone().show();
        var item_num = $.dynamicFields.findNumber(item.find(':input:first').attr('id')) + 1;
        var new_id;
        var new_name;

        item.find("input[name$='[_destroy]']").remove(); // don't need to copy the _destroy field

        item.find(':input').each(function(){
          if ($(this).attr('id')) {
            new_id = $(this).attr('id').replace(/\d/, ''+item_num);
            $(this).attr('id', new_id);
          }

          new_name = $(this).attr('name').replace(/\d/, ''+item_num);
          $(this).attr('name', new_name);

          // reset all fields
          if ($(this)[0].type == 'textarea' || $(this)[0].type == 'text' || $(this)[0].type.match(/select/)){
            $(this).val("");
          }else if ($(this)[0].type == 'radio'){
            $(this).attr("checked", false)
          }else if ($(this)[0].type == 'checkbox'){
            $(this).attr("checked", false)
          }

        })

        item.find('label').each(function(){
          if ($(this).attr('for')){
            new_id = $(this).attr('for').replace(/\d/, ''+item_num);
            $(this).attr('for', new_id);
          }
        })

        item.insertAfter(origin);
        return item;
      }
    }
  };

})(jQuery);