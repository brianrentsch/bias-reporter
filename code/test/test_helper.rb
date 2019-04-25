ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  ##
  # A testing analogue of the faculty_sessions 'logged_in?' helper method. Returns true if a test school is logged in
  def is_logged_in?
    !session[:school_id].nil?
  end
end
