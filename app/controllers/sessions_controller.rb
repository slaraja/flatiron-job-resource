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
            session[:user_id] = @user.user.id
            redirect_to user_path(@user)
        #if no user, it will return nill. if they have a user, then it will authenticate
        else
            flash[:error] = "Sorry, please try again. Your login details were not correct."  
            redirect_to login_path
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end