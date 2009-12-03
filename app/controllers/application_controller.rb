# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :authorize
  layout "main" # default layout
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :plain_password
  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please login"
      redirect_to :controller => 'session', :action => 'login'
    end
  end

end
