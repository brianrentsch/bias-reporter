class ApplicationController < ActionController::Base

  def template
    render html: '<div><strong>Racial Bias Reporter - Content Coming Soon!</strong><br><br>
                  Here are some current functionality stubs:<br><br>/users - a user creation stub<br>
                  /reports - a report generation stub</div>'.html_safe
  end
end
