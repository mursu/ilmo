class SessionController < ApplicationController
  skip_before_filter :authorize, :only => :login
  def login
    if request.post?
      user = User.authenticate(params[:username], params[:plain_password])
      if user
        session[:user_id] = user.id
        redirect_to root_url
      else
        flash.now[:notice] = "Invalid username or password"
      end
    end
  end

  def logout
    reset_session
    flash[:notice] = "Logged out!"
    redirect_to :controller => 'session', :action => 'login'
  end

end
