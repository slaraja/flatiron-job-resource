class ApplicationController < ActionController::Base

    def logged_in?
        !!current_user
      end
      
      def current_user  
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
      end
  
      def redirect_if_not_logged_in
        if !logged_in?
            redirect_to '/'
        end
      end 

end
