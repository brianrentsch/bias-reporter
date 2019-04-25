require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:report_one)    
  end

  test "should get index" do    
    get reports_url
    assert_redirected_to new_report_url
  end

  test "should get new" do
    get new_report_url
    assert_response :success
    assert_select "title", "Submit a Report | Bias Reporter"
  end

  test "should create report" do       
    get new_report_path
    assert_response :success
    assert_difference 'Report.count', 1 do
      post reports_url, params: { report: { user_identifier: "UID", date: "2019-24-01", details: "Mytext", location: "Somewhere", time: "12:00am", school_id: 1 } }
    end
    
    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success    
end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { date: @report.date, details: @report.details, location: @report.location, time: @report.time } }
    assert_not flash.empty?
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
