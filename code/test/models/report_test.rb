require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  
  def setup    
    @report = Report.new(user_identifier: "UID")
  end

  test "should be valid" do
    assert @report.valid?
  end
  
  ##
  # Presence testing
  test "user_identifier should be present" do
    @report.user_identifier = ""
    assert_not @report.valid?
  end


end
