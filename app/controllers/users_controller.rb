class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        #if it reloads, we want it to re-render the information that has been added so far
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else           
            render :new
        end
    end

    def show

        @user = User.find_by_id(params[:id])
       #redirect to somewhere else if someone types something else into URL
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :grad_date, :linkedin_profile, :status, :username, :email, :password)
    end
end
 