require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get root route" do
    get root_url
    assert_response :success
  end
  
  test "should get index" do
    get home_index_url
    assert_response :success
    assert_select "title", "Home | Bias Reporter"
  end
end
