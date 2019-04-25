# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: integration tests for account creation functionality
# Auto-Generated?: Generated and modified by me.

require 'test_helper'

##
# Class for testing account creation functionality
class InstitutionSignupTest < ActionDispatch::IntegrationTest
  ##
  # Test invalid signup
  test "invalid signup information" do
    get new_school_path
    assert_no_difference 'School.count' do
      post schools_path, params: { school: { name:  "",
                                         email: "school@invalid",
                                         address: "",
                                         state: "",
                                         city: "",
                                         zip_code: "",
                                         password: "pass",
                                         password_confirmation: "word" } }
    end
    assert_template 'schools/new'
  end

  ##
  # Test valid signup
  test "valid signup information" do
    get new_school_path
    assert_difference 'School.count', 1 do
      post schools_path, params: { school: { name:  "Example School",
                                         email: "school@valid.com",
                                         address: "111 Education Lane",
                                         state: "PA",
                                         city: "Philidelphia",
                                         zip_code: "010101",
                                         password:              "example",
                                         password_confirmation: "example" } }

    end
    follow_redirect!
    assert_template 'schools/show'
    assert is_logged_in?
    assert_not flash.empty?
  end

  ##
  # Test signup of school already present in DB
  test "duplicate signup information" do
    get new_school_path
    assert_difference 'School.count', 1 do
      post schools_path, params: { school: { name:  "Example School",
                                         email: "school@valid.com",
                                         address: "111 Education Lane",
                                         state: "PA",
                                         city: "Philidelphia",
                                         zip_code: "010101",
                                         password:              "example",
                                         password_confirmation: "example" } }

    end
    follow_redirect!
    assert_template 'schools/show'
    assert_not flash.empty?  
    assert is_logged_in? #First school successfully signed up
    get new_school_path    
    assert_no_difference 'School.count' do
       post schools_path, params: { school: { name:  "Example School",
                                         email: "school@valid.com",
                                         address: "110 Education Lane",
                                         state: "PA",
                                         city: "Philidelphia",
                                         zip_code: "010101",
                                         password:              "example",
                                         password_confirmation: "example" } }
      
    end
    assert_template 'schools/new' #lack of redirect indicates failed signup  
  end
end
