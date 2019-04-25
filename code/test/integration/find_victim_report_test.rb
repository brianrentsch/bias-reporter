require 'test_helper'

class FindVictimReportTest < ActionDispatch::IntegrationTest
  #Catch unwanted flash persistence  
  test "Try to find report with unknown user ID" do
    get track_reports_path
    assert_template 'track_reports/index'
    post track_reports_path, params: { victim_session: { user_identifier: "" } }
    assert_template 'track_reports/index'
    assert_not flash.empty?  #Check that flash has triggered
    get root_url          #Switch page
    assert flash.empty?   #Check that flash has disappeared
    assert_response :success
  end
end
