module DynamicFieldsHelper

  def dynamic_fields_wrapper_for(form_object, options={:class => 'item'}, &block)
    content_tag("fieldset", :class => options[:class]) do
      if form_object.object.persisted?
        concat form_object.hidden_field :_destroy
      end

      concat content_tag(:div, link_to("remove", '#'), :class => 'remove_dynamic_field')

      block.call
    end
  end

end