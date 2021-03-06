class SessionsController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        #did we find the user and did they enter the correct password?
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Please try again. Your login details are incorrect."
            redirect_to login_path
        end
    end

    def google
        user = User.from_omniauth(request.env['omniauth.auth'])
            if user.valid?
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to '/login'
            end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end