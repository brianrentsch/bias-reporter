##
# A class representing a controller which handles HTTP requests relating to the track_reports page.
class TrackReportsController < ApplicationController
  ##
  # GET /track_reports  
  def index
  end

  ##
  # Display a report based on the entered userID
  # POST /track_reports
  def create
    @report = Report.find_by(user_identifier: params[:victim_session][:user_identifier].downcase)
    if @report 
      find_report @report  #Call helper method to create session
      redirect_to @report
    else
      flash.now[:danger] = 'User ID not found in the system'
      render 'index'
    end    
  end
end
