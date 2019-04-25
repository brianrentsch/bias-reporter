# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: controller tests for the home controller
# Auto-Generated?: Auto-generated, but modified by me.
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
