require 'test_helper'

class FacultySessionsControllerTest < ActionDispatch::IntegrationTest
  ##
  # Test acquisition of new login path
  test "should get new" do
    get login_path
    assert_response :success
  end

end
