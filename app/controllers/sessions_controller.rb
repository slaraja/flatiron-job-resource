class SessionsController < ApplicationController

    def index

    end

    def new

    end

    def create
        #does the user exist in the system
        @user = User.find_by(username: params[:user][:username])
        #did we find the user and did they enter the correct password?
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            #set the user id in the session
            redirect_to root_path
            # redirect_to user_path(@user)
        else
            flash[:alert] = "Sorry, please try again. Your login details were not correct."  
            redirect_to login_path
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end