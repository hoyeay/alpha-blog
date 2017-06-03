require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  # set variables to use for testing
  def setup
    @category = Category.create(name: 'sports')
    @category2 = Category.create(name: 'programming')
  end
  
  test 'should show categories listing' do
    # get categories_path page
    get categories_path
    # test that the view for the method index in categories_controller.rb is displayed
    assert_template 'categories/index'
    # test that @category exists as a path in category_path page
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    # test that @category2 exists as a path in category_path page
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end