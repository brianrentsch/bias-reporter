##
# A class representing a controller which handles HTTP requests relating to the track_reports page.
class TrackReportsController < ApplicationController
  ##
  # GET /track_reports/index  
  def index
  end
  
  def create
    report = Report.find_by(user_identifier: params[:victim_session][:user_identifier].downcase)
    if report #report.authenticate(params[:session][:user_identifier])
      render '/home/index'
    else
      flash.now[:danger] = 'User ID not found in the system'
      render 'index'
    end
    
  end
end
