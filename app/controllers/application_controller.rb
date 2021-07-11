class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user
  
  private
  
    def logged_in?
        !!current_user
    end
      
    def current_user  
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
        #if current user is already defined, it will equal #current user
        #otherwise it will find user id in the user table
    end
  
    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to '/'
        end
    end 

end
