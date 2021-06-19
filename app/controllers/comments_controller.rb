class CommentsController < ApplicationController


    def new
        @job = Job.find_by_id(params[:job_id])
        @comment = @job.comments.build
    end

    def index
        
    end
    



end
