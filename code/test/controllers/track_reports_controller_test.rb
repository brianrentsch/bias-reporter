require 'test_helper'

class TrackReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get track_reports_index_url
    assert_response :success
    assert_select "title", "Track Reports | Bias Reporter"
  end

end
