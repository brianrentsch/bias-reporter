require 'test_helper'

class InstitutionSignupTest < ActionDispatch::IntegrationTest
  ##
  # Test invalid signup
  test "invalid signup information" do
    get schools_new_path
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
    get schools_new_path
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
  end
end
