module FacultySessionsHelper

  ##
  # Helper method to log in a user session for a school
  def log_in(school)
    session[:school_id] = school.id
  end 

  ##
  # Helper method to log out a user session for a school
  def log_out
    session.delete(:school_id)
    @current_user = nil
  end

  ##
  # Returns the current logged-in school if there is one
  def current_school
    if session[:school_id]
      @current_school ||= School.find_by(id: session[:school_id])
    end
  end

  ##
  # Returns true if the school is logged in, false if not
  def logged_in?
    !current_school.nil?
  end
  
end
