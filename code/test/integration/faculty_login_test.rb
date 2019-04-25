require 'test_helper'

##
# Class for testing login functionality
class FacultyLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @school = schools(:college1)
  end
 
  #Catch unwanted flash persistence  
  test "Try to log in" do
    get login_path
    assert_template 'faculty_sessions/new'
    post login_path, params: { faculty_session: { name: "", password: "" } }
    assert_template 'faculty_sessions/new'
    assert_not flash.empty?  #Check that flash has triggered
    assert_not is_logged_in?
    get root_url          #Switch page
    assert flash.empty?   #Check that flash has disappeared
    assert_response :success
  end

  #Test login of valid school with an invalid password
  test "should fail to login" do
    get login_path
    assert_template 'faculty_sessions/new'
    post login_path, params: { faculty_session: { name: @school.name, password: "wordpass" } }
    assert_template 'faculty_sessions/new' #Lack of redirect indicates login failure
    assert_not is_logged_in?
    assert_not flash.empty?      
    get root_url          
    assert flash.empty?   
    assert_response :success
  end


  #Test valid login
  test "login with valid information" do    
    get login_path
    assert_template 'faculty_sessions/new'    
    post login_path, params: { faculty_session: { name: @school.name, password: "password" } }
    assert is_logged_in?
    assert_redirected_to @school
    follow_redirect!
    assert_template 'schools/show'
    assert_select "a[href=?]", login_path, count: 0   #Ensure nav-bar links have changed
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", school_path(@school)
  end

  #Test valid login followed by logout
  test "login followed by logout" do    
    get login_path
    assert_template 'faculty_sessions/new'    
    post login_path, params: { faculty_session: { name: @school.name, password: "password" } }
    assert is_logged_in?
    assert_redirected_to @school
    follow_redirect!
    assert_template 'schools/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", school_path(@school)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path   #Ensure that nav-bar links have changed
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", school_path(@school), count: 0   
  end

end

