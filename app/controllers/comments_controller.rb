class CommentsController < ApplicationController


    def new
        if @job = Job.find_by_id(params[:job_id])
            @comment = @job.comments.build
          else
            @comment = Comment.new
          end
    end

    def create
      
    end

    def index
        
    end
    

end
