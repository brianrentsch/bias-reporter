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
