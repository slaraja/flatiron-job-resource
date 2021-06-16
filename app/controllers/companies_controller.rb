class CompaniesController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @companies = Company.all
    end

end
