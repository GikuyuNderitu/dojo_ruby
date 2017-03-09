require 'test_helper'

class SaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get says_index_url
    assert_response :success
  end

  test "should get hello" do
    get says_hello_url
    assert_response :success
  end

  test "should get show" do
    get says_show_url
    assert_response :success
  end

end
