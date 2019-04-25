# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: controller tests for the track_reports page
# Auto-Generated?: Auto-generated, but modified by me.
require 'test_helper'

class TrackReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get track_reports_path
    assert_response :success
    assert_select "title", "Track a Report | Bias Reporter"
  end
  
end
