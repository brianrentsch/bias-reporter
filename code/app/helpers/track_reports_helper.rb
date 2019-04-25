module TrackReportsHelper
  ##
  # Create a new user session for viewing a report
  def find_report(report)
    session[:user_id] = report.user_identifier
  end

end
