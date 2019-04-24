require 'test_helper'

class TrackReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get track_reports_path
    assert_response :success
    assert_select "title", "Track a Report | Bias Reporter"
  end
  
end
