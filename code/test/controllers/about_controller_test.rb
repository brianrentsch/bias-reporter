# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: controller tests for 'about' page
# Auto-Generated?: Auto-generated, but modified by me.
require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get about_index_url
    assert_response :success
    assert_select "title", "About | Bias Reporter"
  end
end
