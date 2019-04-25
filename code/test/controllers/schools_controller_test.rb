require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_school_url
    assert_response :success
    assert_select "title", "New Account | Bias Reporter"
  end

end
