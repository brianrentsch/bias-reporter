require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  def setup
    @school = School.new(name: "TestSchool", email: "contact@school.edu", address: "217 College Rd", 
                         city: "Boston", state: "Massachusetts", zip_code: "000001", 
                         password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @school.valid?
  end
  
  ##
  # Presence testing
  test "name should be present" do
    @school.name = ""
    assert_not @school.valid?
  end

  test "address should be present" do
    @school.address = ""
    assert_not @school.valid?
  end

  test "city should be present" do
    @school.city = ""
    assert_not @school.valid?
  end

  test "state should be present" do
    @school.state = ""
    assert_not @school.valid?
  end

  test "ZIP should be present" do
    @school.zip_code = ""
    assert_not @school.valid?
  end

  test "password should be present" do
    @school.password = @school.password_confirmation = " " * 6
    assert_not @school.valid?
  end

  ##
  # Length testing
  test "name should not be too long" do
    @school.name = "a" * 51
    assert_not @school.valid?
  end

  test "address should not be too long" do
    @school.address = "a" * 101
    assert_not @school.valid?
  end

  test "city should not be too long" do
    @school.city = "a" * 31
    assert_not @school.valid?
  end

  test "state should not be too long" do
    @school.state = "a" * 21
    assert_not @school.valid?
  end

  test "ZIP should not be too long" do
    @school.zip_code = "a" * 16
    assert_not @school.valid?
  end

  test "email should not be too long" do
    @school.email = "a" * 201
    assert_not @school.valid?
  end

  test "password should not be too short" do
    @school.password = @school.password_confirmation = "a"
    assert_not @school.valid?
  end
  
  ##
  # Uniqueness testing
  test "both name and address should be unique" do
    duplicate_school = @school.dup
    @school.save
    assert_not duplicate_school.valid?
  end

  test "name should be unique" do
    duplicate_school = @school.dup
    @school.address = "a"  #Make the address unique for this test case
    @school.save
    assert_not duplicate_school.valid?
  end

  test "name should be unique case insensitive" do
    duplicate_school = @school.dup
    @school.address = "a"
    duplicate_school.name = @school.name.upcase #Test reaction to uppercase of same name
    @school.save
    assert_not duplicate_school.valid?
  end

  test "address should be unique" do
    duplicate_school = @school.dup
    @school.name = "a"  #Make the name unique for this test case
    @school.save
    assert_not duplicate_school.valid?
  end  

  test "address should be unique case insensitive" do
    duplicate_school = @school.dup
    @school.name = "a"
    duplicate_school.address = @school.address.upcase #Test reaction to uppercase of same address
    @school.save
    assert_not duplicate_school.valid?
  end  

end
