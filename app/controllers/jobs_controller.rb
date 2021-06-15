class JobsController < ApplicationController
    def new
       @job = Job.new 
       @job.build_company #flipped because it's a belongs to
       #put it in new because we're not doing it in edit
    end


    private

    def user_params
        params.require(:job).permit(:title, :level, :link, company_id, company_attributes: [:name][:location])
    end

end
