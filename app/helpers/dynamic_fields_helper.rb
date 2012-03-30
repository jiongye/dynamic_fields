module DynamicFieldsHelper

  def dynamic_fields_wrapper_for(form_object, options={}, &block)
    defaults = {:node => "fieldset", :class => 'item'}
    opts = defaults.merge(options)

    content_tag(opts[:node], :class => opts[:class]) do
      if form_object.object.persisted?
        concat form_object.hidden_field :_destroy
      end

      concat content_tag(:div, link_to("remove", '#'), :class => 'remove_dynamic_field')

      block.call
    end
  end

end