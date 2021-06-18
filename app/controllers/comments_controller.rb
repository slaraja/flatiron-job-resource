class CommentsController < ApplicationController

    def index
        
    end
    
    def new
        @job = Job.find_by_id(params[:id])
        @review.build_comment 
        #because it already knows about a review and is a belongs_to
    end


end
