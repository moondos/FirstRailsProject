class ApplicationController < ActionController::Base
    
    helper_method :current_user, :notification_status

  def current_user
      User.find(session[:user_id]) if session[:user_id] 
  end

  def notification_status
    # $notification = True
  end

end
