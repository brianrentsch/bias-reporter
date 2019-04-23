require 'test_helper'

class FacultySessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get faculty_sessions_new_url
    assert_response :success
  end

end
