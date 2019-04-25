require 'test_helper'

class ViewReportsTest < ActionDispatch::IntegrationTest
  
  def setup
    @school = schools(:college1)
  end

  test "try to view reports" do
    get login_path 
    post login_path, params: { faculty_session: { name: @school.name, password: "password" } }
    assert is_logged_in?
    assert_redirected_to @school
    follow_redirect!
    @reports = Report.where(:school_id => @school.id)
    assert @reports.empty? #There should be reports associated with this school        
    assert_template 'schools/show'
  end

  test "try to view nonexistant reports" do
    get login_path 
    post login_path, params: { faculty_session: { name: @school.name, password: "password" } }
    assert is_logged_in?
    assert_redirected_to @school
    follow_redirect!
    assert_template 'schools/show'
    @reports = Report.where(:school_id => 2)
    assert @reports.empty?     
    assert_template 'schools/show'
  end

  test "try to view reports with bad login" do
    get login_path 
    post login_path, params: { faculty_session: { name: @school.name, password: "pswd" } }
    assert_not is_logged_in?
    @reports = Report.where(:school_id => @school.id)
    assert @reports.empty? #There should be reports associated with this school    
    assert_template 'faculty_sessions/new'    
  end
end
