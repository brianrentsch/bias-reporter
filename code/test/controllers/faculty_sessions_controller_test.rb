# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: controller tests for login session functionality
# Auto-Generated?: Auto-generated, but modified by me.

require 'test_helper'

class FacultySessionsControllerTest < ActionDispatch::IntegrationTest
  ##
  # Test acquisition of new login path
  test "should get new" do
    get login_path
    assert_response :success
  end

end
