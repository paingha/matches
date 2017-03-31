require 'test_helper'

class TestimoniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testimonies_index_url
    assert_response :success
  end

  test "should get show" do
    get testimonies_show_url
    assert_response :success
  end

  test "should get new" do
    get testimonies_new_url
    assert_response :success
  end

  test "should get edit" do
    get testimonies_edit_url
    assert_response :success
  end

end
