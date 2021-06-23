class JobsController < ApplicationController
    
    def index
        redirect_if_not_logged_in 
        @jobs = Job.all
    end

    def new
       redirect_if_not_logged_in 
       @job = Job.new 
       @job.build_company #flipped because it's a belongs to
       #put it in new because we're not doing it in edit
    end

    def create
        redirect_if_not_logged_in 
        @job = Job.new(job_params)
        @job.user_id = session[:user_id] #refactor
        #if it reloads, we want it to re-render the information that has been added so far
        if @job.save
            # session[:user_id] = @job.id
            #don't need to store the job id in the session
            redirect_to job_path(@job)
        else           
            render :new
        end
    end

    def show
        redirect_if_not_logged_in 
        @job = Job.find_by_id(params[:id])
        #redirect to somewhere else if someone types something else into URL
        #  redirect_to '/' if !@user
    end

    def edit
        redirect_if_not_logged_in 
        @job = Job.find_by_id(params[:id])
    end
    #    #find the job by id

    # #    
    #    @job = Job.find_by(id: params[:id])

    #     #if current user is the owner, then edit the job
    #     if @job.save
    #         redirect_to job_path(@job)
    #     else           
    #         render :new
    #     end

    def update
        @job = Job.find_by_id(params[:id])
        @job.update(job_params)
        redirect_to job_path(@job)
    end

    def destroy
        Job.find_by_id(params[:id]).destroy
        redirect_to jobs_path
      end
     

    private

    def job_params
        params.require(:job).permit(:title, :level, :link, :company_id, company_attributes: [:name, :location])
        #company_attributes comes from accepts_nested_attributes in model
    end

end
