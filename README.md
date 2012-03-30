Dynamic Fields
=====================

dynamic_fields is a rails engine, written for dynamically generating nested model form fields.  You can use it with the built in form helpers or any other form builder gem like 'simple_form'. It will keep the structure and style from them. It is currently only support rails 3.1+


Installation
-----------

### Rails 3.1

1. Add the gem to your Gemfile and run `bundle install` to make sure the gem gets installed.

        gem 'dynamic_fields'

2. Add this line to `app/assets/javascripts/application.js`. Be sure to include this line after jQuery and jQuery UJS Adapter.

        //= require dynamic_fields

3. (Optional) Add this line to `app/assets/stylesheets/application.css`. This is only used to style the remove link for the nested fields. Most of the time you will need to style it according to your layout.

        *= require dynamic_fields



Basic Usage
-----------

### Model

Your model need to setup to use `accepts_nested_attributes_for` with `:allow_destroy => true` option, in order for the nested form to work

### View

In your form, you can use the `dynamic_fields_wrapper_for` helper method to wrap your nested form fields.
Here is an example using the simple_form builder in haml:

    #more_qa
      Add More QA

    #qas
      = f.simple_fields_for :qas do |qa|
        = dynamic_fields_wrapper_for(qa) do
          = qa.input :question, :input_html => {:class => 'span6'}
          = qa.input :answer, :input_html => {:class => 'span6'}


### Javascript

Add this to your js file

    jQuery ->
      $('#more_qa').click ->
        $("#qas").cloneFields()


That is all you have to do to get it to work.


Override Defaults
-----------------

The default wrapper node generate from `dynamic_fields_wrapper_for` is "fieldset" with class "item". 
You can override them by passing a hash to the helper method like this:

    = dynamic_fields_wrapper_for(qa, :node => 'div', :class => 'nested_field') do
      = your code block
      
If you override the :class option, you will need to apply that to the Javascript as well:

    $("#qas").cloneFields({
      itemWrapper: ".nested_field"
    })
  
  
Example
--------

If you want to take a look at an example, you can checkout the dummy app that used for testing.  



Copyright
--------
This project uses MIT-LICENSE.