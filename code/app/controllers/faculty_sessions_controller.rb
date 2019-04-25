# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: controller class for the faculty sessions (e.g. login) page
# Auto-Generated?: Created and modified by me
class FacultySessionsController < ApplicationController

  ##
  # GET /login 
  def new
  end

  ##
  # Create a faculty web session based on the school logged into
  # POST /login
  def create
    @school = School.find_by(name: params[:faculty_session][:name].downcase)    
    if @school && @school.authenticate(params[:faculty_session][:password])
      log_in @school
      redirect_to current_school
    else
      flash.now[:danger] = 'Invalid school name or password'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Succesfully logged out"
    redirect_to root_url
  end
end
