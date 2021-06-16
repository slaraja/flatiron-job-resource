class JobsController < ApplicationController

    
    def new
       @job = Job.new 
       @job.build_company #flipped because it's a belongs to
       #put it in new because we're not doing it in edit
    end

    def create
        @job = Job.new(job_params)
        @job.user_id = session[:user_id] #refactor
        #if it reloads, we want it to re-render the information that has been added so far
        if @job.save
            session[:user_id] = @job.id
            # redirect_to job_path(@job)
        else           
            render :new
        end
    end


    private

    def job_params
        params.require(:job).permit(:title, :level, :link, :company_id, company_attributes: [:name, :location])
    end

end
