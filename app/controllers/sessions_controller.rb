class SessionsController < ApplicationController

    def index

    end

    def new

    end

    def create
        #does the user exist in the system
        @user = User.find_by(username: params[:user][:username])
        #did we find the user and did they enter the correct password?
        if @user.try(.authenticate, params[:user][:username])
            
        end
        byebug
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end