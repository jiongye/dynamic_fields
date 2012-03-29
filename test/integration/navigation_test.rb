require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase

  def setup
    1.upto(4) { FactoryGirl.create(:available_language) }
  end

  def teardown
    AvailableLanguage.delete_all
  end

  test 'the new category page should render the form correctly' do
    visit new_category_path
    assert page.has_selector?('fieldset.item')
    assert find('.remove_dynamic_field').has_content?('remove')
    assert !page.has_selector?("fieldset.item input[name*='_destroy']")
  end

  test 'be able to generate another nested fieldset' do
    Capybara.current_driver   = :selenium
    visit new_category_path
    find("#more_subcategories").click
    assert_equal 2, all('fieldset.item').size
  end

  test 'create a category with multiple subcategories' do
    Capybara.current_driver   = :selenium
    visit new_category_path
    fill_in "category_name", :with => "good category"
    fill_in "category_subcategories_attributes_0_name", :with => "this is a new subcategory"
    find("#more_subcategories").click
    fill_in "category_subcategories_attributes_1_name", :with => "this is another subcategory"
    find(".form-actions input").click
    category = Category.find_by_name("good category")
    assert category
    assert_equal category, Subcategory.find_by_name("this is a new subcategory").category
    assert_equal category, Subcategory.find_by_name("this is another subcategory").category
  end


end

