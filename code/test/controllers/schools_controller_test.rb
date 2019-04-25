# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: controller tests for the school controller
# Auto-Generated?: Auto-generated, but modified by me.
require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_school_url
    assert_response :success
    assert_select "title", "New Account | Bias Reporter"
  end

end
