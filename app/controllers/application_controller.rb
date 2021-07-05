class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user
  #syntax only needed if using in the views
  
  private
  
    def logged_in?
        !!current_user
    end
      
    def current_user  
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
        #if current user is already defined, it will equal #current user
        #otherwise it will find user id in the user table
        #if session user id - only makes a call if there is a session id
    end
  
    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to '/'
        end
    end 

end
