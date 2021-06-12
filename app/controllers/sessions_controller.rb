class SessionsController < ApplicationController

    def index

    end

    def new

    end

    def create

    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end