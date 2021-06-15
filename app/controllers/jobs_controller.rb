class JobsController < ApplicationController
    def new
       @job = Job.new 
       @job.build_company #flipped because it's a belongs to
       #put it in new because we're not doing it in edit

    end
end
