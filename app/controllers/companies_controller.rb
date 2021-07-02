class CompaniesController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @companies = Company.all
    end

    def show
        @company = Company.find_by_id(params[:id])
    end

    private

    def company_params
        params.require(:company).permit(:name, :location)
    end

end
