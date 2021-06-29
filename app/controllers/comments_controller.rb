class CommentsController < ApplicationController


    def new
        if @job = Job.find_by_id(params[:job_id])
            @comment = @job.comments.build
          else
            @comment = Comment.new
          end
    end

    def create
      redirect_if_not_logged_in 
      @comment = Comment.new(comment_params)
      @comment.user_id = session[:user_id] 
      #if it reloads, we want it to re-render the information that has been added so far
      if @comment.save
          #retuns same value as valid
          # session[:user_id] = @job.id
          #don't need to store the job id in the session
          redirect_to comment_path(@comment)
      else           
          render :new
      end
    end

    def index
        
    end

  def comment_params
      params.require(:comment).permit(:content, :job_id)
  end

end
