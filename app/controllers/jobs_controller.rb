class JobsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_job, only: [:edit, :udpate]
    
    def index
        @jobs = Job.all
        @jobs = Job.alpha
    end

    def new
       @job = Job.new 
       @job.build_company 
       #put build in new because we're not doing it in edit
    end

    def create
        @job = Job.new(job_params)
        @job.user_id = session[:user_id] 
        #if it reloads, we want it to re-render the information that has been added so far
        if @job.save
            #retuns same value as valid
            redirect_to job_path(@job)
        else           
            render :new
        end
    end

    def show
        if 
            @job = Job.find_by_id(params[:id])
        else 
            redirect_to '/'
        end 
    end

    def edit
    end

    def update
        @job.update(job_params)
        redirect_to job_path(@job)
    end
     
    private

    def job_params
        params.require(:job).permit(:title, :level, :link, :company_id, company_attributes: [:name, :location])
        #company_attributes comes from accepts_nested_attributes in model
    end

    def set_job
        @job = Job.find_by_id(params[:id])
    end
 

end
