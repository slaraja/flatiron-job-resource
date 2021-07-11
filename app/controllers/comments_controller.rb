class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in

    def new
        if @job = Job.find_by_id(params[:job_id]) 
          #must be job id to make it nested
            @comment = @job.comments.build
            #use build so the comment already knows which job is assoc
          else
            @comment = Comment.new
          end
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.user_id = session[:user_id] 
      # @comment = current_user.comments.build(comment_params)
      #if it reloads, we want it to re-render the information that has been added so far
      if @comment.save
          #retuns same value as valid. automatically checks belongs to
          # session[:user_id] = @job.id
          #don't need to store the job id in the session
          redirect_to comment_path(@comment)
      else           
          render :new
      end
    end

    def index
      @comments = Comment.all
    end

    def show
      @comment = Comment.find_by_id(params[:id])

    end

  def comment_params
      params.require(:comment).permit(:content, :job_id)
  end

end
